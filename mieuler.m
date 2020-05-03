function [t,u]=mieuler(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
u(:,1)=x0;
for n=1:N
    u(:,n+1)=u(:,n)+h*f(t(n),u(:,n),par);
end




