s = tf("s");

G = 5 * (s + 0.25) / ((s^2 + 2*s)^2);

nyquist(G);
hold on;
grid on;
clear;
clc;
a = linspace(0.0001, 10, 150);
N = (a >= 1) .* (4 ./ (pi * a)) .* (1 - (1 ./ a).^2).^(1/2);
P = -1 ./ N;

plot(real(P), imag(P), 'r', 'LineWidth', 2);
