function [t,u]=miab4am3(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
[~,s]=mirk4(f,t0,t0+3*h,x0,3,par);
u(:,1)=x0; u(:,2)=s(:,2); u(:,3)=s(:,3); u(:,4)=s(:,4);
for n=2:N-2
    Z=u(:,n+3)+h*(55/24*f(t(n+3),u(:,n+3),par)-59/24*f(t(n+2),u(:,n+2),par)+37/24*f(t(n+1),u(:,n+1),par)-9/24*f(t(n),u(:,n),par));
    u(:,n+3)=u(:,n+2)+h/24*(9*f(t(n+3),Z,par)+19*f(t(n+2),u(:,n+2),par)-5*f(t(n+1),u(:,n+1),par)+f(t(n),u(:,n),par)); 
end


