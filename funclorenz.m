function f=funclorenz(t,x,par)
s=par(1); rho=par(2); B=par(3);
f=[s*(x(2)-x(1)); rho*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-B*x(3)];
end

