%% Diskretan sistem, poreemcaj d(k) = A*h(k-Tk)
clc, clear;
Ts = 0.001;
z = tf("z", Ts);
Gpd = 0.1 / (z + 0.3)^2;

RS = [0; 5.7; 0.86; 0.001];

Rd = [1, RS(1) - 1, -RS(1)];
Sd = RS(2:end)';

Rsd = tf(Rd, 1, Ts);
Ssd = tf(Sd, 1, Ts);
Tsd = 1 / dcgain(minreal(1/Rsd * feedback(Gpd, Ssd/Rsd)));

B = Gpd.Numerator{1,1};
A = Gpd.Denominator{1,1};