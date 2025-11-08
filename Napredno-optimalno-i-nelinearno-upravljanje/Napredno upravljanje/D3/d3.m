%% Estimator i regulator:
A = [0, -1;
     1, 1];
B = [1;
     0];
C = [1, 0];
D = 0;
x0 = [3;
      3];
p_est = [-15, -15];
p_reg = [-3, -3];

L = acker(A', C', p_est)';
K = acker(A,B, p_reg);
%% Za referencu:
AA = A - B * K;
r = 10;
s = tf('s');
Wsp0 = C / (s * eye(2) - AA) * B;
kr = 1 / dcgain(Wsp0);