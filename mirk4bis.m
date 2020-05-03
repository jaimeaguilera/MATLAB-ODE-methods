function [t,u]=mirk4bis(f,t0,tfin,x0,N,par)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
u(:,1)=x0;
K=zeros(4,m);
%Datos tablero de Butcher
a1=[0,0,0,0]; a2=[1/2,0,0,0]; a3=[0,1/2,0,0]; a4=[0,0,1,0];
A=[a1; a2; a3; a4];
b=1/6*[1,2,2,1];
c=[0,1/2,1/2,1];
for n=1:N
    for i=1:4
    K(i,:)=f(t(n)+c(i),u(:,n)+h*(A(i,:)*K)',par);
    end
    u(:,n+1)=u(:,n)+h*(b*K)';
end