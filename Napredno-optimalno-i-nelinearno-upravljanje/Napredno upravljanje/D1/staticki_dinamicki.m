%% Staticki sistem
clc, clear;
t = -5:0.01:5;
u = @(t) t;
y = @(t,u) 2 * u(t) + sin(t);

plot(t,u(t));
hold on;
plot(t, y(t,u));
hold off;
legend('u', 'y');

%% Odnos ulaza i izlaza kod statickog sistema
plot(u(t), y(t,u));
grid on;

%% Dinamicki sistem
clc, clear;
t = 0: 0.01 : 10;
dinamicki = @(t, x) dinamicki_sistem(t,x);
[t, sol] = ode45(dinamicki, t, [0;0]);
x2 = sol(:,2);
plot(t,x2);
legend('x2');
%% Odnos ulaza i izlaza kod dinamickog sistema
plot(sin(t), x2, 'LineWidth', 1.5);
grid on;
