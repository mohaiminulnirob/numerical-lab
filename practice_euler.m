function table=practice_euler(f,xrange,y0,h)
  x=xrange(1):h:xrange(2);
  y=[];
  y(1)=y0;
  table(1,:)=[x(1) y(1)];
  for i=2:length(x)
    y(i) = y(i-1) + h * f(x(i-1), y(i-1));
    table(i,:)=[x(i) y(i)];
  end;
end;

f = @(x, y) x + y;           % or: f = inline('x + y', 'x', 'y');
table = practice_euler(f,[0 1],1,0.1);
plot(table(:,1),table(:,2),'r-o','linewidth',1);
xlabel('x value');
ylabel('y value');
title('Euler plot');
grid on;

