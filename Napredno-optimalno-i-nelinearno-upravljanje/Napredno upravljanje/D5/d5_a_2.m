%% Kontinualan sistem, poremecaj oblika d(t) = A*sin(wt)
clc, clear
s = tf("s");
Gpk = 1 / (s * (s + 1));

w = 1;

A = [1, 0, 0, 0, 0; ...
     1, 1, 0, 0, 0; ...
     w^2, 0, 1, 0, 0; ...
     w^2, 0, 0, 1, 0; ...
     0, 0, 0, 0, 1];
% x = [r0; s3; s2; s1; s0]
b = [24; 225; 1225; 3101; 3125];
RS = A \ b;

Rk = [1, RS(1), w^2, w^2 * RS(1)];
Sk = RS(2:end)';

Rsk = tf(Rk, 1);
Ssk = tf(Sk, 1);
Tsk = 1 / dcgain(1/Rsk * feedback(Gpk, Ssk/Rsk));

B = Gpk.Numerator{1,1};
A = Gpk.Denominator{1,1};