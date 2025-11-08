s = tf("s");

G = 4 / (s^3 - 2*s^2 + s);

nyquist(G);
hold on; grid on;

k   = 1;
eps = 0.01;

a = linspace(eps*1.001, 5, 200);

N = (2*k/pi) .* ( asin(eps./a) + (eps./a) .* sqrt(1 - (eps./a).^2) );

P = -1 ./ N;

plot(real(P), imag(P), 'r', 'LineWidth', 2);
legend("Nyquist of G(s)","-1/N(a)","Location","best");
title("Describing Function Locus with Saturation Nonlinearity");
