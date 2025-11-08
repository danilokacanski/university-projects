global epsilon
x0=[10;0.1];
t0=[0 50];
[t,x]=ode45('vdpolin',t0,x0);
plot (t,x(:,1))
