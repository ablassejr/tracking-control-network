% temp_pgd_attack.m
% Native MATLAB implementation of PGD adversarial attack on the CSTR
% tracking control system from Fig2a.m.
%
% Implements the equivalent of:
%   pgd   = ProjectedGradientDescent(classifier, eps=eps_val, eps_step=tau, max_iter=Npgd)
%   y_adv = pgd.generate(y)
%
% Attack target : temperature measurement y (x2 in the paper)
% Classifier    : sliding-mode sign controller  S = sign(y - r2)
% Loss          : squared tracking error  L(delta) = ||y + delta - r2||^2
% Gradient proxy: surrogate sub-gradient  nabla_delta L = y + delta - r2
% PGD update    : delta = clip(delta + tau*sign(nabla_delta L),  -eps, eps)

%% ── System Parameters (from Fig2a.m) ─────────────────────────────────────────
alpha  = 1;
betta  = 100;
lambda = 0.3;
gamma  = 20;
B      = 1;
Da     = 0.072;
n      = 45000;
tmax   = 45;
dt     = tmax / n;

%% ── PGD Hyperparameters ───────────────────────────────────────────────────────
eps_val = 0.1;   % L-inf ball radius  (epsilon)
tau     = 0.01;  % step size          (alpha / eps_step)
Npgd    = 40;    % iteration count    (max_iter)

%% ── Step 1: Simulate clean system (Fig2a.m) ──────────────────────────────────
x  = zeros(1, n);
y  = zeros(1, n);
t  = zeros(1, n);
r1 = zeros(1, n);
r2 = zeros(1, n);
S  = zeros(1, n);
u  = zeros(1, n);
e1 = zeros(1, n);
e2 = zeros(1, n);

for i = 1:n-1
    t(i+1) = t(i) + dt;

    if     0  <= t(i+1) && t(i+1) <= 15,   r1(i+1) = 0.4472;
    elseif 15 <  t(i+1) && t(i+1) <  30,   r1(i+1) = 0.7646;
    else,                                    r1(i+1) = 0.4472;
    end

    if     0  <= t(i+1) && t(i+1) <= 15,   r2(i+1) = 2.752;
    elseif 15 <  t(i+1) && t(i+1) <  30,   r2(i+1) = 4.7052;
    else,                                    r2(i+1) = 2.752;
    end

    f1 = x(i) + dt*(-alpha*x(i) + Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));
    f2 = y(i) + dt*(-alpha*y(i) + B*Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));

    if     y(i)-r2(i) > 0,  S(i) =  1;
    elseif y(i)-r2(i) < 0,  S(i) = -1;
    else,                    S(i) =  0;
    end

    u(i) = -1/lambda * (-betta*S(i) + r2(i+1) - r2(i) - f2);

    x(i+1) = f1;
    y(i+1) = y(i) + dt*(-betta*S(i) + r2(i+1) - r2(i));

    e1(i+1) = x(i+1) - r1(i+1);
    e2(i+1) = y(i+1) - r2(i+1);
end

%% ── Step 2: PGD attack ────────────────────────────────────────────────────────
% delta(k+1) = clip( delta(k) + tau * sign( y + delta(k) - r2 ),  -eps, eps )
%
% Rationale: loss L = ||y + delta - r2||^2
%            nabla_delta L = 2*(y + delta - r2)
%            sign(nabla_delta L) = sign(y + delta - r2)
%            We ascend the loss gradient to maximise tracking error.
%
% The gradient direction changes each iteration as delta shifts
% the measurement closer to (or past) the sign-change boundary r2.

delta = zeros(1, n);

for k = 1:Npgd
    nabla = y + delta - r2;            % surrogate gradient  (n x 1 vector op)
    delta = delta + tau * sign(nabla); % gradient ascent step
    delta = max(-eps_val, min(eps_val, delta));  % project onto L-inf ball
end

y_adv = y + delta;                     % adversarial temperature measurements

%% ── Step 3: Simulate attacked system ─────────────────────────────────────────
% Controller sees y_adv; actual plant state evolves from true dynamics.
x_att  = zeros(1, n);
y_att  = zeros(1, n);
S_att  = zeros(1, n);
u_att  = zeros(1, n);
e1_att = zeros(1, n);
e2_att = zeros(1, n);

for i = 1:n-1
    f1_att = x_att(i) + dt*(-alpha*x_att(i) + Da*(1-x_att(i))*exp(y_att(i)/(1+y_att(i)/gamma)));
    f2_att = y_att(i) + dt*(-alpha*y_att(i) + B*Da*(1-x_att(i))*exp(y_att(i)/(1+y_att(i)/gamma)));

    % Controller uses adversarial measurement y_adv instead of y_att
    if     y_adv(i)-r2(i) > 0,  S_att(i) =  1;
    elseif y_adv(i)-r2(i) < 0,  S_att(i) = -1;
    else,                         S_att(i) =  0;
    end

    u_att(i) = -1/lambda * (-betta*S_att(i) + r2(i+1) - r2(i) - f2_att);

    x_att(i+1) = f1_att;
    y_att(i+1) = y_att(i) + dt*(-betta*S_att(i) + r2(i+1) - r2(i));

    e1_att(i+1) = x_att(i+1) - r1(i+1);
    e2_att(i+1) = y_att(i+1) - r2(i+1);
end

%% ── Step 4: Report ───────────────────────────────────────────────────────────
flip_rate = mean(sign(y_adv - r2) ~= S);
fprintf('PGD results  (eps=%.3f  tau=%.4f  Npgd=%d)\n', eps_val, tau, Npgd);
fprintf('  Sign-flip rate     : %.1f%%\n',  flip_rate * 100);
fprintf('  Max  |delta|       : %.4f\n',    max(abs(delta)));
fprintf('  Mean |delta|       : %.4f\n',    mean(abs(delta)));
fprintf('  RMS tracking error clean    e2 : %.4f\n', rms(e2));
fprintf('  RMS tracking error attacked e2 : %.4f\n', rms(e2_att));

%% ── Step 5: Plot ─────────────────────────────────────────────────────────────
figure('Name', 'PGD Attack on CSTR Tracking Control');

subplot(3,1,1)
plot(t, y, 'k-', t, y_att, 'b--', t, r2, 'r-')
ylabel('x_2 (Temperature)')
xlabel('Time (s)')
legend('Clean y', 'Attacked y', 'r_2', 'Location', 'best')
title(sprintf('PGD: \\epsilon=%.2f  \\tau=%.3f  N_{pgd}=%d', eps_val, tau, Npgd))
axis([0 tmax 0 5])
grid on

subplot(3,1,2)
plot(t, e2, 'k-', t, e2_att, 'b--')
yline(0, 'r--')
ylabel('e_2 = y - r_2')
xlabel('Time (s)')
legend('Clean error', 'Attacked error', 'Location', 'best')
axis([0 tmax -3 2.5])
grid on

subplot(3,1,3)
plot(t, delta, 'g-')
ylabel('\delta (Perturbation)')
xlabel('Time (s)')
title(sprintf('Max |\\delta| = %.4f  (L-\\infty bound = %.2f)', max(abs(delta)), eps_val))
axis([0 tmax -eps_val*1.1 eps_val*1.1])
grid on
