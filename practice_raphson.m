function table=practice_raphson(f,df,x0,tol,max_iter)
  x=x0;
  table=[];
  for i=1:max_iter
    fx=f(x);
    dfx=df(x);
    table(i,:)=[x,fx];
    if(abs(fx)<=tol || abs(dfx)<=1e-12)
       break;
    end;
    x=x-fx/dfx;


  end;
end;


f = @(x) x^3 - 2*x^2 - 4;          % Function
df = @(x) 3*x^2 - 4*x;             % Derivative

x0 = 3;                            % Initial guess
tol = 1e-6;                        % Tolerance
max_iter = 50;
result = practice_raphson(f, df, x0, tol, max_iter);
