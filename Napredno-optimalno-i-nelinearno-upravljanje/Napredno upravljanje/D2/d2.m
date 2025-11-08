%% Model:
A = [0, -1;
    1, 1];
B = [1; 0];
C = [1, 0]; 
D = 0;
x0 = [3;
      3];
k = acker(A,B,[-5, -5]);  % Hocu da bude stabilno p12 = -5;
%% Sada treba izracunati Kr, aliticki dobijeno isto u svesci:
r = 10;
s = tf('s');
AA = A - B * k;
Wsp0 = C / (s* eye(2) - AA) * B;
kr = 1/(dcgain(Wsp0));