function [t,u]=midiffcent(pqr,t0,tfin,a,b,N)

h=(tfin-t0)/(N+1);
ts=(t0+h:h:tfin-h);

e = ones(N,1);
%D2hc
A1 = spdiags([e -2*e e],-1:1,N,N);
A1=full(A1)/h^2;
%Dhc
A2=spdiags([-e 0*e e],-1:1,N,N);
A2=full(A2)/h;

p=zeros(N,1);
q=zeros(N,1);
r=zeros(N,1);
for i=1:N
    p(i)=feval(pqr{1},ts(i));
    q(i)=feval(pqr{2},ts(i));
    r(i)=feval(pqr{3},ts(i));
end

A=A1-A2.*p-eye(N).*q;
%Vector c inhomogeneo
r(1)=r(1)-a*(1/h^2+feval(pqr{1},ts(1))/(2*h));
r(N)=r(N)+b*(-1/h^2+feval(pqr{1},ts(N))/(2*h));

X=A\r;
u=[a;X;b];
t=[t0,ts,tfin];
end