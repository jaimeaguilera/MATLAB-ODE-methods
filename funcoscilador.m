function f=funcoscilador(t,x,par)
%par=[A;B;a;w];
A=par(1);
B=par(2);
a=par(3);
w=par(4);
f=[x(2);A*cos(w*t)-2*B*x(2)-a*x(1)];
end
