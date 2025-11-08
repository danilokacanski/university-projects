%% Prvi zadatak b radna tacka 3
% Ranges (a > 0)
a = linspace(0.01, 5, 200);   % strictly positive a
b = linspace(-3, 3, 200);

% Grid
[A, B] = meshgrid(a, b);

% D(a,b)
D = 1 - 4 * B.*(A + B);

% Plot surface
figure;
surf(A, B, D);
xlabel('a'); ylabel('b'); zlabel('D(a,b)');
title('D(a,b) with a > 0 and D=0 plane');
shading interp; colorbar; hold on;

% Add D = 0 plane
Z0 = zeros(size(A));
surf(A, B, Z0, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', 'red');

legend('D surface','D = 0 plane', 'Location', 'best');
view(45, 30); grid on; axis tight;
