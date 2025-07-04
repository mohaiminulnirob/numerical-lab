f=input('Enter the function: ');
%n=input('Number of varibales: \n');
fprintf('Enter initial values of a & b\n');
a=input('a: ');
b=input('b: ');
table=practice_bisection(f,a,b,1e-4,25);
display(table);


