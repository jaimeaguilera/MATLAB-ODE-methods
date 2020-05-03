function [t,u]=mirk4(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
u(:,1)=x0;
for n=1:N
    K1=f(t(n),u(:,n),par);
    K2=f(t(n)+h/2,u(:,n)+h/2*K1,par);
    K3=f(t(n)+h/2,u(:,n)+h/2*K2,par);
    K4=f(t(n)+h,u(:,n)+h*K3,par);
    u(:,n+1)=u(:,n)+h/6*(K1+2*K2+2*K3+K4);
end