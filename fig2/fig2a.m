%% Fig2a.m - State Tracking Performance for CSTR Sliding Mode Control
%  This script simulates a Continuous Stirred Tank Reactor (CSTR) system
%  with sliding mode control to track piecewise constant reference signals.
%  Plots: State variables x1 (concentration) and x2 (temperature) vs references.

%% ==================== Initial Conditions ====================
x(1)=0.;              % Initial concentration (x1)
t(1)=0;               % Initial time
y(1)=0.;              % Initial temperature (x2, using y as variable name)

%% ==================== Simulation Parameters ====================
n=45000;              % Number of simulation steps
tmax=45;              % Total simulation time (seconds)
dt=tmax/n;            % Time step size (delta t)

%% ==================== Cost Function Weights (unused in this script) ====================
Q=10;                 % State weighting matrix coefficient
R=0.01;               % Control input weighting coefficient

%% ==================== System and Controller Parameters ====================
m(1)=1;               % Step counter initialization
alpha=1;              % System decay rate coefficient
betta=100;            % Sliding mode control gain (reaching law parameter)
lambda=0.3;           % Control input gain (g2 coefficient)
gamma=20;             % Activation energy parameter for reaction kinetics
B=1;                  % Heat of reaction coefficient
Da=0.072;             % Damkohler number (ratio of reaction rate to flow rate)

%% ==================== Reference Signal Initialization ====================
r1(1)=0.;             % Initial reference for x1 (concentration)
r2(1)=0.;             % Initial reference for x2 (temperature)

%% ==================== Tracking Error Initialization ====================
e1(1)=x(1)-r1(1);     % Initial tracking error for concentration
e2(1)=y(1)-r2(1);     % Initial tracking error for temperature

%% ==================== Control Input Initialization ====================
u(1)=0;               % Initial control input

%% ==================== Main Simulation Loop ====================
for i=1:n-1,

m(i+1)=m(i)+1;        % Increment step counter

%% ---------- Control Input Coefficients (Affine System: x_dot = f + g*u) ----------
g1(i)=0;              % Control coefficient for x1 equation (no direct control)
g2(i)=lambda;         % Control coefficient for x2 equation

%% ---------- System Dynamics (Euler Discretization of CSTR Model) ----------
% f1: Concentration dynamics with reaction term (Arrhenius kinetics)
f1(i)=x(i)+dt*(-alpha*x(i)+Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));

% f2: Temperature dynamics with reaction heat generation
f2(i)=y(i)+dt*(-alpha*y(i)+B*Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));

%% ---------- Time Update ----------
t(i+1)=t(i)+dt;

%% ---------- Piecewise Constant Reference for x1 (Concentration) ----------
% Reference changes at t=15s and t=30s to test tracking performance
   if 0<=t(i+1) & t(i+1)<=15
    r1(i+1)=0.4472;           % Low concentration setpoint
    elseif 15<t(i+1) & t(i+1)<30
    r1(i+1)=0.7646;           % High concentration setpoint
    elseif 30<=t(i+1) & t(i+1)<tmax
    r1(i+1)=0.4472;           % Return to low concentration
    end

%% ---------- Piecewise Constant Reference for x2 (Temperature) ----------
   if 0<=t(i+1) & t(i+1)<=15
    r2(i+1)=2.752;            % Low temperature setpoint
    elseif 15<t(i+1) & t(i+1)<30
    r2(i+1)=4.7052;           % High temperature setpoint
    elseif 30<=t(i+1) & t(i+1)<tmax
    r2(i+1)=2.752;            % Return to low temperature
   end

%% ---------- Sliding Surface Sign Function ----------
% S(i) = sign(e2) determines the switching control action
if (y(i)-r2(i))>0
S(i)=1;                       % Error positive: above reference
elseif (y(i)-r2(i))<0
S(i)=-1;                      % Error negative: below reference
else
S(i)=0;                       % On the sliding surface
end

%% ---------- Control Law Computation ----------
u1(i)=0;                      % No control for concentration (indirectly controlled)
% Sliding mode control law for temperature tracking
u2(i)=-1/g2(i)*(-betta*S(i)+r2(i+1)-r2(i)-f2(i));

%% ---------- State Update (Closed-Loop Dynamics) ----------
x(i+1)=f1(i);                 % Concentration evolves according to open-loop dynamics
y(i+1)=y(i)+dt*(-betta*S(i)+r2(i+1)-r2(i));  % Temperature with sliding mode control

% Alternative: Perfect tracking (commented out)
%x(i+1)=r1(i+1);
%y(i+1)=r2(i+1);

%% ---------- Tracking Error Update ----------
e1(i+1)=x(i+1)-r1(i+1);       % Concentration tracking error
e2(i+1)=y(i+1)-r2(i+1);       % Temperature tracking error

end

%% ==================== Plotting Results ====================
% Upper subplot: Concentration (x1) and its reference (r1)
subplot(2,1,1), plot(t,x,'k-',t,r1,'r--')
axis([0 tmax 0 0.8])
legend('x_1','r_1')
grid
ylabel('x_1,r_1')
xlabel('Time (s)')
hold on;

% Lower subplot: Temperature (x2) and its reference (r2)
subplot(2,1,2), plot(t,y,'k-',t,r2,'r--')
axis([0 tmax 0 5])
ylabel('x_2, r_2')
legend('x_2','r_2')
xlabel('Time (s)')
grid

%% ==================== Cleanup ====================
clear all;
