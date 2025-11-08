%% Sistem
A = [0, -1; 1, 1];
B = [1; 0];
C = [0, 1];
D = 0;
%% Model proremecaja, za d = const. pa je samim tim matrica stanja 0, i direktno utice na izlaz
Aw = 0;
Cw = 1;
%% Prosireni sistem za estimaciju stanja + poremecaja
% Observer mora da ima 3 pola, 2 za stanja sistema, i 1 za poremecaj
p_observer = [-15, -15, -15]; 

A_bar = [A, B * Cw; 0, 0, Aw];
C_bar = [C, 0];

L = acker(A_bar', C_bar', p_observer)';

Lx = L(1:2);
Lw = L(3);
%% Regulator po stanjima
p_sistem = [-3, -3];
K = acker(A, B, p_sistem);
%% Pojacanje za referencu, zelimo da ima jedinicki staticki prenos
Ak = A - B * K;
R = 5;
s = tf("s");
G0 = C * inv(s * eye(2) - Ak) * B;
% Da bi sistem u ss: kr * r --> y
kr = 1 / dcgain(s * G0 / s);