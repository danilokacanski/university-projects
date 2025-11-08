%% Funkcija prenosa oblika (s + b0)/(s^2 + a1*s + a0)
Gp = tf([1,5],[1,3,6]);
Tf = 1;

%%
t = out.tout;
a_1 = out.theta.Data(1, :);
a_0 = out.theta.Data(2, :);
b_0 = out.theta.Data(4, :);

%%
length(t), length(a_1)
hold on;
plot(t(3:length(t)), a_1, LineWidth = 1.2, color='r');
plot(t(3:length(t)), a_0, LineWidth = 1.2, color='b');
plot(t(3:length(t)), b_0, LineWidth = 1.2, color='c');
legend('a_1', 'a_0', 'b_0');
grid on;
