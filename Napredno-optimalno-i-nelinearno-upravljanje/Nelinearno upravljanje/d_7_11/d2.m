s = tf("s");

G = 40 / (s*(s+2)*(s+8));

w = logspace(-2, 2, 2000);   
nyquist(G, w);
hold on; grid on;

K = 1;                    
a = linspace(0.1, 5, 200);  

beta = acos( sqrt( 1 - (K./a).^2 ) );
fprintf(beta);
N = (4*K ./ (pi*a)) .* exp(-1j*beta);

P = -1 ./ N;

plot(real(P), imag(P), 'r', 'LineWidth', 2);
legend("Nyquist of G(s)","-1/N(a)","Location","best");
title("Describing Function Locus with Hysteresis Relay");
