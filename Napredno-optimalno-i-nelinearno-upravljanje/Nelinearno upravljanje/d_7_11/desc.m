s = tf("s");

G = s / (s^2 - s + 1);
% G = 5 * (s + 0.25) / ((s^2 + 2*s)^2);

nyquist(G);
hold on;
grid on;

% 7.11.5
clear;
clc;
a = linspace(0.0001, 10, 15000);
N = 5 * a.^4 / 8;
P = -1 ./ N;
plot(real(P), imag(P), 'r', 'LineWidth', 2);

% % 7.11.6
% clear;
% clc;
% a = linspace(0.0001, 10, 15000);
% N = 2 + 4 ./ (pi * a);
% P = -1 ./ N;
% 
% plot(real(P), imag(P), 'r', 'LineWidth', 2);

% % 7.11.7
% clear;
% clc;
% a = linspace(0.0001, 10, 150);
% N = (a >= 1) .* (4 ./ (pi * a)) .* (1 - (1 ./ a).^2).^(1/2);
% P = -1 ./ N;
% 
% plot(real(P), imag(P), 'r', 'LineWidth', 2);

% % 7.11.8
% clear;
% clc;
% a = linspace(0.0001, 10, 1500);
% A = 1;
% B = 3/2;
% k = 2;
% 
% N = k * (1 - N_7_11_8(a ./ A)) .* (A <= a & a <= B) + ...
%     k * (N_7_11_8(a ./ B) - N_7_11_8(a ./ A)) .* (a > B);
% 
% P = -1 ./ N;
% 
% plot(real(P), imag(P), 'r', 'LineWidth', 2);

