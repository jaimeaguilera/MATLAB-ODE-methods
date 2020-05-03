function f=funbelza(t,x,par)
a=par(1); b=par(2); c=par(3); d=par(4); %alpha betta gamma delta%
f=[a*(x(2)-x(1)*x(2)+x(1)-b*x(1)^2);1/a*(c*x(3)-x(2)-x(1)*x(2));d*(x(1)-x(3))];
end
