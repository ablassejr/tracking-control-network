x(1)=0;
t(1)=0;
y(1)=0.08;
n=5000;
tmax=8.;
dt=tmax/n;
Q=1;
R=1;
gamma=1;
e(1)=x(1)-0.08*sin(pi/2*t(1));
u(1)=0;

for i=1:n-1,
    
f2(i)=-6.5*(y(i)-0.08*pi/2*cos(0.5*pi*t(i)))-(0.56+1.85*abs(y(i)-0.08*pi/2*cos(0.5*pi*t(i))))*sign(y(i)-0.08*pi/2*cos(0.5*pi*t(i)))-0.56*sin(28.09*pi*(x(i)));
    
g2(i)=1.5;
    
if y(i)-0.08*pi/2*cos(0.5*pi*t(i))>0 | y(i)-0.08*pi/2*cos(0.5*pi*t(i))==0
u(i)=-1/g2(i)*(f2(i)+sqrt(f2(i)^2+Q*g2(i)^2/R));
elseif y(i)-0.08*pi/2*cos(0.5*pi*t(i))<0
u(i)=-1/g2(i)*(f2(i)-sqrt(f2(i)^2+Q*g2(i)^2/R));
end
 
t(i+1)=t(i)+dt;
 
x(i+1)=x(i)+dt*y(i);
    
if (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))>0 | (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))==0
y(i+1)=y(i)-dt*((gamma*sqrt(f2(i)^2+Q*g2(i)^2/R))+randn(1)*1e-6);
elseif (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))<0
y(i+1)=y(i)+dt*((gamma*sqrt(f2(i)^2+Q*g2(i)^2/R))+randn(1)*1e-6); 
end

e(i+1)=x(i+1)-0.08*sin(pi/2*t(i+1));

end
 
f2(n)=-6.5*(y(n)-0.08*pi/2*cos(0.5*pi*t(n)))-(0.56+1.85*abs(y(n)-0.08*pi/2*cos(0.5*pi*t(n))))*sign(y(n)-0.08*pi/2*cos(0.5*pi*t(n)))-0.56*sin(28.09*pi*(x(n)));
    
g2(n)=1.5;
   
if (y(n)-0.08*pi/2*cos(0.5*pi*t(n)))>0 | (y(n)-0.08*pi/2*cos(0.5*pi*t(n)))==0
u(n)=-1/g2(n)*(f2(n)+sqrt(f2(n)^2+Q*g2(n)^2/R));
elseif (y(n)-0.08*pi/2*cos(0.5*pi*t(n)))<0
u(n)=-1/g2(n)*(f2(n)-sqrt(f2(n)^2+Q*g2(n)^2/R));
end

subplot(2,1,1),plot(t,x,'k-')
axis([0 8 -0.1 0.1])
 
ylabel('y (m)')
 
hold on;
 
subplot(2,1,2),plot(t,e,'k-')
 
axis([0 8 -1e-3 -0e-3])
ylabel('e (m)')
 
xlabel('Time t (s)')
 
grid
exportgraphics(gcf, '/Users/Apple/work/tracking-control-network/research-vault/Research Journal/Paper/figures/images/piezo_position_tracking.png', 'Resolution', 300);
clear all;
