function table=practice_seidel_error(A, b, x, tol, max_iter)
  table=[];
  %table(1,:)=x;
  n=length(b);
  for j=2:max_iter
    x_old=x;
    for i=1:n
      s1=A(i,1:i-1) * x(1:i-1);
      s2=A(i,i+1:n) * x_old(i+1:n);
      x(i)=(b(i)-s1-s2)/A(i,i);
    endfor
    er=norm(x-x_old,inf);
    x(n+1)=er;
    table(j-1,:)=x;
      if(er<=tol)
        break;
      end;
  endfor
end;

A = [4 -1 0; -1 4 -1; 0 -1 3];
b = [15; 10; 10];
x0 = [0; 0; 0];
tol = 1e-6;
max_iter = 25;
result = practice_seidel_error(A, b, x0, tol, max_iter);
fprintf('iteration\t\tx\ty\tz\terror\n');
for i=1:size(result,1)
fprintf('%d\t%.6f\t%.6f\t%.6f\t%.6f\n',i,result(i,1)
,result(i,2),result(i,3),result(i,4));
end;
iters=0:size(result,1)-1;
figure;
plot(iters,result(:,1),'r-o','linewidth',1);
hold on;
plot(iters,result(:,2),'g-o','linewidth',1);
plot(iters,result(:,3),'b-o','linewidth',1);
plot(iters,result(:,4),'m-*','linewidth',2);
