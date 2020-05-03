function [t,u,rechazo, ERROR,H]=mirkf45(f,t0,tfin,x0,h0,hmin,hmax,TOL,par)
%Preallocating
%hmax constante del programa o parametro de entrada
fac=0.9; facmax=5; 
m=size(x0);
m=m(1);
u(:,1)=x0;
h=h0;
n=1;
t=t0;
p=4;
rechazo=0;
H=0;
K=zeros(6,m);
a1=[0,0,0,0,0,0]; a2=[1/4,0,0,0,0,0]; a3=[3/32,9/32,0,0,0,0];
a4=[1932/2197,-7200/2197,7296/2197,0,0,0]; a5=[439/216,-8,3680/513,-845/4104,0,0];
a6=[-8/27, 2, -3544/2565, +1859/4104, -11/40, 0];
A=[a1;a2;a3;a4;a5;a6];
c=[0,1/4,3/8,12/13,1,1/2];
b=[25/216,0,+1408/2565,2197/4104,-1/5,0];
vectorerror=[1/360,0,-128/4275,-2197/75240,1/50,2/55];
ERROR=0;
while t(n)<tfin
    for i=1:6  
    K(i,:)=f(t(n)+h*c(i),u(:,n)+h*(A(i,:)*K)',par);
    end
    Z=u(:,n)+h*(b*K)';
    ERR=norm(vectorerror*K);
    if ERR<TOL && h>hmin
    u=[u,Z];
    t=[t,t(n)+h];
    n=n+1;
    ERROR=[ERROR,ERR];
    H=[H,h];
    elseif h<hmin
        disp('Paso muy pequeño')
        break
    else
    rechazo=rechazo+1;    
    end
    h=min(hmax,h*min(facmax,fac*(TOL/ERR)^(1/p)));
end
    
    