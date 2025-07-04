function table=practice_jacobi(A, b, x, tol, max_iter)
  table=[];
  table(1,:)=x;
  n=length(b);
  for j=2:max_iter
    x_old=x;
    for i=1:n
      s1=A(i,1:i-1) * x_old(1:i-1);
      s2=A(i,i+1:n) * x_old(i+1:n);
      x(i)=(b(i)-s1-s2)/A(i,i);
    endfor
    table(j,:)=x;
    er=norm(x-x_old,inf);
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
result = practice_jacobi(A, b, x0, tol, max_iter);
fprintf('iteration\t\tx\ty\tz\n');
for i=1:size(result,1)
fprintf('%d\t%.4f\t%.4f\t%.4f\n',i,result(i,1)
,result(i,2),result(i,3));
end;
iters=0:size(result,1)-1;
plot(iters,result(:,1),'r-o','linewidth',1);
hold on;
plot(iters,result(:,2),'g-o','linewidth',1);
plot(iters,result(:,3),'b-o','linewidth',1);

