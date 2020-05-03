function [t,u]=mimilne(f,t0,tfin,x0,N,par)
%Parece peor método que miab4
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
%tengo dos opciones, o calcular todo el RK o solo los 4 valores%
[~,s]=mirk4(f,t0,t0+3*h,x0,3,par);
u(:,1)=x0; u(:,2)=s(:,2); u(:,3)=s(:,3); u(:,4)=s(:,4);
for n=4:N
    u(:,n+1)=u(:,n-3)+4*h/3*(2*f(t(n),u(:,n),par)-f(t(n-1),u(:,n-1),par)+2*f(t(n-2),u(:,n-2),par));
end
end


