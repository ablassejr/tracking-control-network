x(1)=0.;
t(1)=0;
y(1)=0.;
n=45000;
tmax=45;
dt=tmax/n;
Q=10;
R=0.01;
m(1)=1;
alpha=1;
betta=100;
lambda=0.3;
gamma=20;
B=1;
Da=0.072;
r1(1)=0.;
r2(1)=0.;
e1(1)=x(1)-r1(1);
e2(1)=y(1)-r2(1);
u(1)=0;
programCount = 1;
avgTime = zeros(20);
% ==========================
diary("matlab_output.log")
for j=1:programCount,
tic
for i=1:n-1,

m(i+1)=m(i)+1;

sigma = 2;
Ik = sigma * dt * randn();

g1(i)=0;
g2(i)=lambda;

f1(i)=x(i)+dt*(-alpha*x(i)+Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));
f2(i)=y(i)+dt*(-alpha*y(i)+B*Da*(1-x(i))*exp(y(i)/(1+y(i)/gamma)));


t(i+1)=t(i)+dt;

   if 0<=t(i+1) & t(i+1)<=15
    r1(i+1)=0.4472;
    elseif 15<t(i+1) & t(i+1)<30
    r1(i+1)=0.7646;
    elseif 30<=t(i+1) & t(i+1)<tmax
    r1(i+1)=0.4472;
    end

   if 0<=t(i+1) & t(i+1)<=15
    r2(i+1)=2.752;
    elseif 15<t(i+1) & t(i+1)<30
    r2(i+1)=4.7052;
    elseif 30<=t(i+1) & t(i+1)<tmax
    r2(i+1)=2.752;
   end

if (y(i)-r2(i))>0
S(i)=1;
elseif (y(i)-r2(i))<0
S(i)=-1;
else
S(i)=0;
end

u1(i)=0;
u2(i)=-1/g2(i)*(-betta*S(i)+r2(i+1)-r2(i)-f2(i));

x(i+1)=f1(i);
y(i+1)=y(i)+dt*(-betta*S(i)+r2(i+1)-r2(i)) + Ik;

%x(i+1)=r1(i+1);
%y(i+1)=r2(i+1);

e1(i+1)=x(i+1)-r1(i+1);
e2(i+1)=y(i+1)-r2(i+1);

end;
toc
end;
diary off;
% print("Average Runtime:" + mean(avgTime))
figure(1)
plot(t,x,'k-',t,r1,'r--')
axis([0 tmax 0 0.8])
legend('x_1','r_1')
grid
ylabel('x_1,r_1')
xlabel('Time (s)')

figure(2)
plot(t,y,'k-',t,r2,'r--')
axis([0 tmax 0 5])
ylabel('x_2, r_2')
legend('x_2','r_2')
xlabel('Time (s)')
grid

writematrix([t', x', y', r1', r2', e1', e2'], 'fig2a_reference.csv');
clear all;
