%% TF sistema
s = tf("s");
Gp = (s + 2) / (s^2 + 7*s + 12);

%% R, S, T, A i B
[R, S] = calculateRS(Gp, [1, 9, 27, 27]); % Koliko brzo zelimo ss samo da je s<0 u polinomu

Rs = tf(R, 1);
Ss = tf(S, 1);

T = 1 / dcgain(1 / Rs * feedback(Gp, Ss / Rs));

B = Gp.Numerator{1,1};
A = Gp.Denominator{1,1};