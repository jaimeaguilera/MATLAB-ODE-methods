function f=funchamilton(t,x,par)
a=par(1); b=par(2);
f=[x(2);-b-a*x(1)/((x(1))^2+(x(3))^2)^(3/2);x(4);-a*x(3)/((x(1))^2+(x(3))^2)^(3/2)];
end