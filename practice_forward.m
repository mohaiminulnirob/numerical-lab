function [y_interp, diff_table] = practice_forward(x,y,x_interp)
  n = length(x);
  h = x(2) - x(1);
  diff_table = zeros(n, n);
  diff_table(:,1) = y(:);

  for j = 2:n
    for i = 1:(n - j + 1)
      diff_table(i,j) = diff_table(i+1,j-1) - diff_table(i,j-1);
    end
  end

  fprintf('\nForward Difference Table:\n');
  disp(diff_table(:,1:min(n,6)));
  u = (x_interp - x(1)) / h;
  y_interp = y(1);
  u_term = 1;

  for i = 1:n-1
    u_term *= (u - (i - 1));
    y_interp += (u_term * diff_table(1,i+1)) / factorial(i);
  end
end

x = [0 1 2 3 4];
y = [1 2 4 8 16];
x_interp = 2.5;
[y_val, table] = practice_forward(x, y, x_interp);
fprintf('\nInterpolated value at x = %.2f is %.6f\n', x_interp, y_val);
disp("Stored full difference table:");
disp(table);

% Generate smooth x-values within the interpolation range
xx = linspace(min(x), max(x), 100);

% Evaluate interpolated y-values at each xx using your function
yy = zeros(size(xx));
for i = 1:length(xx)
  yy(i) = practice_forward(x, y, xx(i));
end

% Plotting
plot(x, y, 'ro', 'MarkerFaceColor', 'r'); % Original data points
hold on;
plot(xx, yy, 'b-', 'LineWidth', 2);       % Interpolated curve
plot(x_interp, y_val, 'ks', 'MarkerSize', 8, 'MarkerFaceColor', 'k'); % Point at x_interp
xlabel('x');
ylabel('y');
legend('Data Points', 'Interpolated Curve', 'Interpolated Value', 'location', 'best');
title('Newton Forward Interpolation Plot');
grid on;

