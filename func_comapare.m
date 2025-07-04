function func_compare()
  f1=input('enter function 1: ');
  f2=input('enter function 2: ');
  fplot(f1,[-pi,pi],'b--');
  hold on;
  fplot(f2,[-pi,pi],'g--');
  legend('f1','f2');
end
