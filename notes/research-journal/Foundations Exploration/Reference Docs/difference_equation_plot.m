x = 0:1:100;
f = @(n,y) 0.5*y;
nspan = [0 100];
y0 = 1000;
[n,y] = ode45(f,nspan, y0);
plot(n, y);
