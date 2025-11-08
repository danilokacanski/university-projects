s = tf('s');
G = 40 / (s*(s+2)*(s+8));

K = 1;              
w = 1.58;           

Gjw = freqresp(G, w);
Gjw = Gjw(:);     

f = @(a) abs(Gjw * ( (4*K ./ (pi*a)) .* exp(-1j*acos( sqrt(1 - (K./a).^2) )) )) - 1;

a_sol = fzero(f, [K+1e-3, 10]);

fprintf('Solution a ≈ %.4f\n', a_sol);
