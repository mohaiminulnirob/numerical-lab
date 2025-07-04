f = @(x) x^3 - 2*x^2 - 4;
df = @(x) 3*x^2 - 4*x;

a = 0; b = 3;        % Interval for Bisection & False Position
x0 = 3;              % Initial guess for Newton-Raphson
tol = 1e-6;          % Tolerance
max_iter = 50;       % Max iterations

% Bisection Method
bis = bisection(f, a, b, tol, max_iter);

% False Position Method
fp = false_position(f, a, b, tol, max_iter);

% Newton-Raphson Method
nr = newton_raphson(f, df, x0, tol, max_iter);

% Plotting
figure;
hold on;
plot(0:size(bis,1)-1, bis(:,3), 'b-o', 'LineWidth', 1.5);   % x from bisection
plot(0:size(fp,1)-1, fp(:,3), 'r-s', 'LineWidth', 1.5);     % x from false position
plot(0:size(nr,1)-1, nr(:,1), 'g-^', 'LineWidth', 1.5);     % x from newton-raphson

xlabel('Iteration');
ylabel('x (root approximation)');
title('Comparison of Root-Finding Methods');
%legend('Bisection', 'False Position', 'Newton-Raphson', 'Location', 'best');
legend('Bisection', 'False Position', 'Newton-Raphson', 'Location', 'northeastoutside');

grid on;
