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

for i=1:n-1,   

m(i+1)=m(i)+1;
    
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

u(i)=-1/g2(i)*(-betta*S(i)+r2(i+1)-r2(i)-f2(i));
   
x(i+1)=f1(i);    
y(i+1)=y(i)+dt*(-betta*S(i)+r2(i+1)-r2(i)); 

e1(i+1)=x(i+1)-r1(i+1);
e2(i+1)=y(i+1)-r2(i+1);
  
end

if (y(n)-r2(n))>0 
S(n)=1;
elseif (y(n)-r2(n))<0
S(n)=-1;
else 
S(n)=0;  
end 

for j=1:n-1,      
    tt(j)=t(j);    
end

figure(1)
plot(t,e1,'g-')
ylabel('e_1')
xlabel('Time (s)')
axis([0 tmax -0.5 0.4])
grid

figure(2)
plot(t,e2,'g-')
ylabel('e_2')
xlabel('Time (s)')
axis([0 tmax -3 2.5])
grid

exportgraphics(figure(1), '/Users/Apple/work/tracking-control-network/research-vault/Research Journal/Paper/figures/images/matlab_fig2c_e1.png', 'Resolution', 300);
exportgraphics(figure(2), '/Users/Apple/work/tracking-control-network/research-vault/Research Journal/Paper/figures/images/matlab_fig2c_e2.png', 'Resolution', 300);
writematrix([t', e1', e2'], 'cstr_tracking_error_reference.csv');
clear all;











