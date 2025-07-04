function table = practice_runge_kutta(f,xrange,y0,h)
  y(1)=y0;
  x=xrange(1):h:xrange(2);

  table(1,:)=[x(1) y(1) 0 0];
  for i=2:length(x)
    k1 = h * f(x(i-1), y(i-1));
    k2 = h * f(x(i-1) + h, y(i-1) + k1);
    y(i) = y(i-1) + 0.5 * (k1 + k2);
    table(i,:)=[x(i) y(i) k1 k2];
  end;
end;

