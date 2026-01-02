%% Fig2b.m - Control Input Signal for CSTR Sliding Mode Control
%  This script simulates a Continuous Stirred Tank Reactor (CSTR) system
%  and plots the sliding mode control input signal over time.
%  Plots: Control input u (full view and zoomed view showing chattering).

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

%% ---------- Sliding Mode Control Law ----------
% u = -g2^(-1) * (-beta*sign(e) + r_dot - f)
% This implements the reaching law to drive the state to the sliding surface
u(i)=-1/g2(i)*(-betta*S(i)+r2(i+1)-r2(i)-f2(i));

%% ---------- State Update (Closed-Loop Dynamics) ----------
x(i+1)=f1(i);                 % Concentration evolves according to open-loop dynamics
y(i+1)=y(i)+dt*(-betta*S(i)+r2(i+1)-r2(i));  % Temperature with sliding mode control

%% ---------- Tracking Error Update ----------
e1(i+1)=x(i+1)-r1(i+1);       % Concentration tracking error
e2(i+1)=y(i+1)-r2(i+1);       % Temperature tracking error

end

%% ==================== Final Step Sign Function ====================
% Compute sign function for the last time step
if (y(n)-r2(n))>0
S(n)=1;
elseif (y(n)-r2(n))<0
S(n)=-1;
else
S(n)=0;
end

% Note: Final control input calculation (commented out)
%g2(n)=lambda;
%u(n)=-1/g2(n)*(-betta*S(n)+r2(n+1)-r2(n)-f2(n));

%% ==================== Prepare Time Vector for Plotting ====================
% Create time vector matching control input dimensions (n-1 elements)
for j=1:n-1,
    tt(j)=t(j);
end

%% ==================== Plotting Results ====================
% Upper subplot: Full view of control input over entire simulation
subplot(2,1,1), plot(tt,u,'b-')
ylabel('u')
xlabel('Time (s)')
axis([0 tmax -350 400])       % Wide y-axis to capture control magnitude
grid
hold on;

% Lower subplot: Zoomed view showing chattering behavior
% Time window [0.25, 0.5]s reveals high-frequency switching (chattering)
% characteristic of sliding mode control
subplot(2,1,2), plot(tt,u,'b-')
ylabel('u')
xlabel('Time (s)')
axis([0.25 0.5 -350 400])     % Zoomed time window
grid

%% ==================== Cleanup ====================
clear all;
