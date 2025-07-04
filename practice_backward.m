function [y_interp, diff_table] = practice_backward(x,y,x_interp)
  n = length(x);
  h = x(2) - x(1);
  diff_table = zeros(n, n);
  diff_table(:,1) = y(:);

  for j = 2:n
    for i = n:-1:j
      diff_table(i,j) = diff_table(i,j-1) - diff_table(i-1,j-1);
    end
  end
  fprintf('\nBackward Difference Table:\n');
  disp(diff_table(:,1:min(n,6)));

  u = (x_interp - x(end)) / h;
  y_interp = y(end);
  u_term = 1;

  for i = 1:n-1
    u_term *= (u + (i - 1));
    y_interp += (u_term * diff_table(n,i+1)) / factorial(i);
  end
end


x = [0 1 2 3 4];
y = [1 2 4 8 16];  % e.g., y = 2^x
x_interp = 3.5;
[y_val, table] = practice_backward(x, y, x_interp);
fprintf('\nInterpolated value at x = %.2f is %.6f\n', x_interp, y_val);
disp('Stored backward difference table:');
disp(table);

