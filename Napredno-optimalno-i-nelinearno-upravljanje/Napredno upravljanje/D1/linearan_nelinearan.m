%% Linearni vs Nelinearni sistemi
clear;
clc;

Ts = 0.001;
fs = 1 / Ts;
t = 0:Ts:10;
N = 10;
f = 1;

%% Definisanje sistema
a = 20; b = 30;

linearan = @(t, x, u) -a * x + b * u(t);           
nelinearan = @(t, x, u) -a * x.^3 + b * u(t);      

%% Princip superpozicije (linearan sistem)
u1 = @(t) sin(2 * pi * 10 * t);
u2 = @(t) sin(2 * pi * 20 * t);
u12 = @(t) u1(t) + u2(t);

[~, y_l1] = ode45(@(t, x) linearan(t, x, u1), t, 0);
[~, y_l2] = ode45(@(t, x) linearan(t, x, u2), t, 0);
[~, y_l12] = ode45(@(t, x) linearan(t, x, u12), t, 0);

figure;
subplot(3,1,1);
plot(t, y_l1, 'b');
title('Linearan sistem - odziv na $u_1(t)$', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
grid on;

subplot(3,1,2);
plot(t, y_l2, 'r');
title('Linearan sistem - odziv na $u_2(t)$', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
grid on;

subplot(3,1,3);
plot(t, y_l12, 'b'); hold on;
plot(t, y_l1 + y_l2, 'r--');
title('Linearan sistem - princip superpozicije', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
legend('$\mathcal{S}(u_1 + u_2)$', '$\mathcal{S}(u_1) + \mathcal{S}(u_2)$', 'Interpreter', 'latex');
grid on;

%% Razlika kod linearnog sistema
figure;
plot(t, y_l12 - (y_l1 + y_l2), 'k', 'LineWidth', 1.2);
title('Linearan sistem - razlika superpozicije', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('Razlika', 'Interpreter', 'latex');
grid on;

%% Princip superpozicije (nelinearan sistem)
[~, y_nl1] = ode45(@(t, x) nelinearan(t, x, u1), t, 0);
[~, y_nl2] = ode45(@(t, x) nelinearan(t, x, u2), t, 0);
[~, y_nl12] = ode45(@(t, x) nelinearan(t, x, u12), t, 0);

figure;
subplot(3,1,1);
plot(t, y_nl1, 'b');
title('Nelinearan sistem - odziv na $u_1(t)$', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
grid on;

subplot(3,1,2);
plot(t, y_nl2, 'r');
title('Nelinearan sistem - odziv na $u_2(t)$', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
grid on;

subplot(3,1,3);
plot(t, y_nl12, 'b'); hold on;
plot(t, y_nl1 + y_nl2, 'r--');
title('Nelinearan sistem - princip superpozicije', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('$y(t)$', 'Interpreter', 'latex'); 
legend('$\mathcal{S}(u_1 + u_2)$', '$\mathcal{S}(u_1) + \mathcal{S}(u_2)$', 'Interpreter', 'latex');
grid on;

%% Razlika kod nelinearnog sistema
figure;
plot(t, y_nl12 - (y_nl1 + y_nl2), 'm', 'LineWidth', 1.2);
title('Nelinearan sistem - razlika superpozicije', 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex'); 
ylabel('Razlika', 'Interpreter', 'latex');
grid on;

%% Frekvencijska analiza
tL = t >= 6;  % deo signala gde je sistem prešao u ustaljeno stanje
u_h = harmonics(N, f, t);
U = fftshift(fft(u_h(tL)));
faxis = linspace(-fs/2, fs/2, length(t(tL)));
L = faxis >= 0 & faxis <= 15;

[~, y_l] = ode45(@(t, x) linearan(t, x, @(t) harmonics(N, f, t)), t, 0);
[~, y_nl] = ode45(@(t, x) nelinearan(t, x, @(t) harmonics(N, f, t)), t, 0);

%% Spektar – linearan sistem
Y_l = fftshift(fft(y_l(tL)));

figure;
subplot(2,1,1)
stem(faxis(L), abs(U(L)), 'LineWidth', 1.2); grid on;
xlabel('$f$ [Hz]', 'Interpreter', 'latex'); 
ylabel('$|U(j\omega)|$', 'Interpreter', 'latex');

subplot(2,1,2)
stem(faxis(L), abs(Y_l(L)), 'LineWidth', 1.2); grid on;
xlabel('$f$ [Hz]', 'Interpreter', 'latex'); 
ylabel('$|Y(j\omega)|$', 'Interpreter', 'latex');

%% Spektar – nelinearan sistem
Y_nl = fftshift(fft(y_nl(tL)));

figure;
subplot(2,1,1)
stem(faxis(L), abs(U(L)), 'LineWidth', 1.2); grid on;
xlabel('$f$ [Hz]', 'Interpreter', 'latex'); 
ylabel('$|U(j\omega)|$', 'Interpreter', 'latex');

subplot(2,1,2)
stem(faxis(L), abs(Y_nl(L)), 'LineWidth', 1.2); grid on;
xlabel('$f$ [Hz]', 'Interpreter', 'latex'); 
ylabel('$|Y(j\omega)|$', 'Interpreter', 'latex');

%% Poređenje: razlika između spektra izlaza i ulaza

% Apsolutna razlika spektralnih amplituda
delta_l = abs(Y_l) - abs(U);
delta_nl = abs(Y_nl) - abs(U);

% Prikas samo moenata gde su te razlike (relativno male) tj. uglavnom nije
% pojava promene zbog mnozenja sa amplitudom F.P.
treshold = 0.05 * max(abs(Y_l));
delta_l = delta_l(delta_l < treshold);
delta_nl = delta_nl(delta_nl < treshold);

% Prikaz samo pozitivnih frekvencija (0 do 15 Hz)
figure;

subplot(2,1,1);
stem(faxis(L), delta_l(L), 'filled', 'LineWidth', 1.2);
xlabel('$f$ [Hz]', 'Interpreter', 'latex');
ylabel('$|\Delta_L(f)|$', 'Interpreter', 'latex');
title('Razlika spektra: Linearan sistem - ulaz vs izlaz', 'Interpreter', 'latex');
grid on;

subplot(2,1,2);
stem(faxis(L), delta_nl(L), 'filled', 'LineWidth', 1.2);
xlabel('$f$ [Hz]', 'Interpreter', 'latex');
ylabel('$|\Delta_{NL}(f)|$', 'Interpreter', 'latex');
title('Razlika spektra: Nelinearan sistem - ulaz vs izlaz', 'Interpreter', 'latex');
grid on;
%% Bode dijagram identifikacija
clear;
clc;

Ts = 0.001; 
fs = 1 / Ts;
t = 0:Ts:10;
N = 40000;
f_b = 0.001;

u = @(t) harmonics(N, f_b, t);

system = @(t, x) -2 * x + 3 * u(t);
[~, x] = ode45(system, t, 0);
y = 3 * x;

%%
U = fftshift(fft(u(t)));
Y = fftshift(fft(y'));
G_mag = 20 * log10(abs(Y ./ U));
waxis = linspace(-fs * pi, fs * pi, length(t));
wmin = 2 * fs * pi / length(t);
wmax = fs * pi;

semilogx(waxis(waxis >= 0), G_mag(waxis >= 0), 'LineWidth', 1, 'LineStyle', '--');
grid on;
hold on;
xlim([wmin, wmax]);
xlabel('$\omega$[log]', 'Interpreter', 'Latex', 'FontSize', 12);

s = tf("s");
G = 9 / (s + 2);
[mag, ~, ~] = bode(G, waxis(waxis >= 0));
plot(waxis(waxis >= 0), 20 * log10(mag(:)), 'LineWidth', 1.2);
legend('Amplitudski spektar dobijen identifikacijom', 'Prava funckija prenosa', 'FontSize', 12);

