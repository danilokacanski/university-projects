s = tf("s");

G = s / (s^2 - s + 1);

nyquist(G);
hold on;
grid on;
clear;
clc;

a = linspace(0.0001, 5, 100);
N = 5 * a.^4 / 8;
P = -1 ./ N;
plot(real(P), imag(P), 'r', 'LineWidth', 2);