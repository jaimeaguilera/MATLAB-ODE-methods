function [t,u]=mieulertr(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
u(:,1)=x0;
for n=1:N
    Z=u(:,n)+h*f(t(n),u(:,n),par);
    u(:,n+1)=u(:,n)+h/2*(f(t(n),u(:,n),par)+f(t(n+1),Z,par)); 
end

