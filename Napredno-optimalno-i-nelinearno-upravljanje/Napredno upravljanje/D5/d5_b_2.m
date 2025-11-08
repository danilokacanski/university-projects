%% Diskretan sitem, pormecaj oblika d(k) = A*sin(kw)
clc, clear;
Ts = 0.001;
z = tf("z", Ts);
Gpd = 0.1 * z^(-2) / (1 + 0.3 * z^(-1))^2;

w = 1;
c = cos(w * Ts);
s = sin(w * Ts);

% Prakticno memoguce izracunati rucno, mora pomocu simulacije

% x = z^-1
syms x;

% Koeficijenti polinoma R0(z) i S(z)
syms r0 r1 r2 s0 s1 s2 s3;

As = (1 + 0.3 * x)^2;
Bs = 0.1 * x^2;
R0s = 1 + r2 * x + r1 * x^2 + r0 * x^3;
Ss = s3 + s2 * x + s1 * x^2 + s0 * x^3;

fcl = As * (1 - 2 * c * x + x^2) * R0s + s * x * Bs * Ss;
fw = (1 - 0.1 * x)^7;     % 2 za sin, 3 za R0(z) i 2 za A(z)

LHS = coeffs(fcl, x);
RHS = coeffs(fw, x);

sol = solve(LHS == RHS);

R0 = tf(double([1, sol.r2, sol.r1, sol.r0]), 1, Ts);
R0.Variable = 'z^-1';

R = (1 - 2 * c * z^(-1) + z^(-2)) / (s * z^(-1)) * R0;

S = tf(double([sol.s3, sol.s2, sol.s1, sol.s0]), 1, Ts);
S.Variable = 'z^-1';

T = 1 / dcgain(minreal(1 / R * feedback(Gpd, S / R), 1e-2));

ff = minreal(T / S, 1e-2);
fb = minreal(S / R, 1e-2);