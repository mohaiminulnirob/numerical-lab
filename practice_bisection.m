function table = practice_bisection(f,a,b,tol, max_iter)
  fa=f(a);
  fb=f(b);
  if(f(a)*f(b)>=0)
     error('no root in this range');
  end;
  table=[];
  for i=1:max_iter
    x=(a+b)/2;
    fx=f(x);
    table(i,:)=[a,b,x,fx];
    if(abs(fx)<=tol || abs(b-a)<=tol)
        break;
    end;
    if(fx*fa<0)
       b=x;
       fb=fx;
    else
       a=x;
       fa=fx;
    end;
   end;
end;


   f=@(x)x^3 - 2*x^2 - 4;
   a=0;
   b=3;
   tol=1e-6;
   max_iter=50;
   table=practice_bisection(f,a,b,tol,max_iter);

   iters=0:size(table,1)-1;
   plot(iters,table(:,1),'r-o');
   hold on;
   plot(iters,table(:,2),'g-s');
   plot(iters,table(:,3),'b-^');
   xlabel('iteration');
   ylabel('value');
   title('Bisection Method');
   legend('a','b','mid','location','best');
   grid on;


   f=@(x)x^3 - 2*x^2 - 4;
   a=0;
   b=3;
   tol=1e-6;
   max_iter=50;
   table=practice_bisection(f,a,b,tol,max_iter);

   iters=0:size(table,1)-1;
   plot(iters,table(:,1),'r-o');
   hold on;
   subplot(2,1,1);
   plot(iters,table(:,3),'b-^');
   xlabel('iteration');
   ylabel('value');
   title('Bisection Method');
   legend('a','b','mid','location','best');
   grid on;


