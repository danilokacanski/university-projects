%% Kontinualan sistem, poremecaj oblika d(t) = A*h(t)
clc,clear;
s = tf("s");
Gpk = 1 / (s * (s + 1));

A = [1, 0, 0, 0;
     1, 1, 0, 0; 
     0, 0, 1, 0; 
     0, 0, 0, 1];
% b = [r0; s2; s1; s0]
b = [19; 131; 500; 625];
RS = A \ b;

Rk = [1, RS(1), 0];
Sk = RS(2:end)';

Rsk = tf(Rk, 1);
Ssk = tf(Sk, 1);
Tsk = 1 / dcgain(1/Rsk * feedback(Gpk, Ssk/Rsk));

B = Gpk.Numerator{1,1};
A = Gpk.Denominator{1,1};