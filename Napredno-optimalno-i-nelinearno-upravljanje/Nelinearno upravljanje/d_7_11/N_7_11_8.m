function N = desc(a)
    N = 2 ./ pi * asin(1 ./ a) + (1 ./ a) .* sqrt(1 - (1 ./ a).^2);
end
s = tf("s");

G = 5 * (s + 0.25) / ((s^2 + 2*s)^2);

nyquist(G);
hold on;
grid on;

clear;
clc;
a = linspace(0.0001, 10, 1500);
A = 1;
B = 3/2;
k = 2;

N = k * (1 - desc(a ./ A)) .* (A <= a & a <= B) + ...
     k * (desc(a ./ B) - desc(a ./ A)) .* (a > B);
 
P = -1 ./ N;
 
plot(real(P), imag(P), 'r', 'LineWidth', 2);

