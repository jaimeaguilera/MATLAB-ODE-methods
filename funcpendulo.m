function f=funcpendulo(t,x,par)
%par=[B;g;l;M];
f=[x(2);par(4)-par(2)/par(3)*sin(x(1))-2*par(1)*x(2)];
end

