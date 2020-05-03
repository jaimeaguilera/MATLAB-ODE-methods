function [t,u]=mimilsimp(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
[~,s]=mirk4(f,t0,t0+3*h,x0,3,par);
u(:,1)=x0; u(:,2)=s(:,2); u(:,3)=s(:,3); u(:,4)=s(:,4);
for n=1:N-3
    Z=u(:,n)+4/3*h*(2*f(t(n+3),u(:,n+3),par)-f(t(n+2),u(:,n+2),par)+2*f(t(n+1),u(:,n+1),par));
    u(:,n+4)=u(:,n+2)+h/3*(f(t(n+4),Z,par)+4*f(t(n+3),u(:,n+3),par)+f(t(n+2),u(:,n+2),par)); 
end
