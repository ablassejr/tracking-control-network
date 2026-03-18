x(1)=0.1;
t(1)=0;
y(1)=0;
n=5000;
tmax=8.;
dt=tmax/n;
Q=1;
R=1;
gamma=1;
e(1)=x(1)-0.08*sin(pi/2*t(1));
u(1)=0;

for i=1:n-1,
    
f2(i)=-6.5*(y(i)-0.08*pi/2*cos(0.5*pi*t(i)))-(0.56+1.85*abs(y(i)-0.08*pi/2*cos(0.5*pi*t(i))))*sign(y(i)-0.08*pi/2*cos(0.5*pi*t(i)))-0.56*sin(28.09*pi*(x(i)-0.08*sin(pi/2*t(i))));
    
g2(i)=1.5;
    
if y(i)-0.08*pi/2*cos(0.5*pi*t(i))>0 | y(i)-0.08*pi/2*cos(0.5*pi*t(i))==0
u(i)=-1/g2(i)*(f2(i)+sqrt(f2(i)^2+Q*g2(i)^2/R));
elseif y(i)-0.08*pi/2*cos(0.5*pi*t(i))<0
u(i)=-1/g2(i)*(f2(i)-sqrt(f2(i)^2+Q*g2(i)^2/R));
end

lim(i)=sqrt(f2(i)^2+Q*g2(i)^2/R);
if lim(i)<1e-6
    err=lim(i)
end   
 
t(i+1)=t(i)+dt;
 
x(i+1)=x(i)+dt*y(i);
dx(i)=(x(i+1)-x(i))/dt;
    
if (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))>0 | (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))==0
y(i+1)=y(i)-dt*((gamma*sqrt(f2(i)^2+Q*g2(i)^2/R))+randn(1)*1e-6-0.08*pi^2/4*sin(0.5*pi*t(i)));
elseif (y(i)-0.08*pi/2*cos(0.5*pi*t(i)))<0
y(i+1)=y(i)+dt*((gamma*sqrt(f2(i)^2+Q*g2(i)^2/R))+randn(1)*1e-6-0.08*pi^2/4*sin(0.5*pi*t(i))); 
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

dx(n)=dx(n-1);

for i=1:n-1,
    d2x(i)=(dx(i+1)-dx(i))/dt;  
end

d2x(n)=d2x(n-1);

lim(n)=sqrt(f2(n)^2+Q*g2(n)^2/R);
if lim(n)<1e-6
    err=lim(n)
end   

subplot(3,1,1),plot(t,e,'k-')
%axis([0 8 -4e-3 -2.5e-3])
ylabel('x_1 (m)')
grid
hold on;

subplot(3,1,2),plot(t,x,'b-')
%axis([0 8 -0.1 0.1])
ylabel('y (m)')
grid
hold on;
 
%subplot(2,1,2),plot(t,e,'r-')
subplot(3,1,3),plot(t,dx,'r-')
%subplot(2,1,2),plot(t,d2x,'r-')
axis([0 8 -0.15 0.15])
ylabel('dy/dt (m/s)')
 
xlabel('Time t (s)')
 
grid
exportgraphics(gcf, '/Users/Apple/work/tracking-control-network/research-vault/Research Journal/Paper/figures/images/piezo_position_velocity.png', 'Resolution', 300);
clear all;
