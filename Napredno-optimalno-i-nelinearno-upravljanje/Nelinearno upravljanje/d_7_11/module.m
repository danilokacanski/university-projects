s = tf('s');
G = 40 / (s*(s+2)*(s+8));

w = 1.58;                           
Gjw = freqresp(G, w);                
mag = abs(Gjw);                       

fprintf('|G(j%.2f)| = %.6f\n', w, mag);
