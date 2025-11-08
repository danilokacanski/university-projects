s = tf("s");

G = 5 * (s + 0.25) / ((s^2 + 2*s)^2);

nyquist(G);
hold on;
grid on;
clear;
clc;

a = linspace(0.0001, 10, 15000);
N = 2 + 4 ./ (pi * a);
P = -1 ./ N;
 
plot(real(P), imag(P), 'r', 'LineWidth', 2);