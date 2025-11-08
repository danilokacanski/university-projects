%% Prvi zadatak b radna tacka 1
% Define the range for a (positive only) and b
a = linspace(0.01, 5, 200);   % strictly positive a
b = linspace(-5, 5, 200);

% Create a grid of (a, b) values
[A, B] = meshgrid(a, b);

% Define D
D = 1 - 4 * (A.^2 + A .* B);

% Plot 3D surface
figure;
surf(A, B, D);
xlabel('a');
ylabel('b');
zlabel('D = 1 - 4(a^2 + ab)');
title('3D Surface plot of D(a,b) with a > 0 and D=0 plane');
shading interp;
colorbar;
hold on;

% Add the D = 0 plane
Z0 = zeros(size(A));  % plane at D = 0
surf(A, B, Z0, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', 'red');

legend('D surface','D=0 plane');
