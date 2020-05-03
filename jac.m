
function jac=jac(t,x,par)
%jac de funccorazon 
%jac=[0,1;-16,0];
%jac de rígida%
%jac=-50;
%jac de Van der Pol
%a=par(1); b=par(2);
%jac=[0,1; -2*a*x(1)*x(2)-1, a*(b-x(1)^2)];
%jac de Belza
%a=par(1); b=par(2); c=par(3); d=par(4); %alpha betta gamma delta%
%jac=[a*(-x(2)+1-2*b*x(1)), a*(1-x(1)), 0; -x(2)/a, 1/a*(-1-x(1)), c/a; d, 0, -d];
%jac de calor
N=par(1);
e = ones(N,1);
A1 = spdiags([e -2*e e],-1:1,N,N);
jac=full(A1);
end



