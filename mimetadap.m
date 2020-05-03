function [t,u,rechazo,ERROR,H]=mimetadap(phi,p,f,t0,tfin,x0,h0,hmin,hmax,TOL,par)
fac=0.9; facmax=5; 
m=size(x0);
m=m(1);
u(:,1)=x0;
h=h0;
n=1;
t=t0;
rechazo=0;
H=0;
ERROR=0;
while t(n)<tfin
    Z=u(:,n)+h*phi(t(n),u(:,n),h,f,par);
    
    phi1=phi(t(n),u(:,n),h/2, f,par);
    yn1=u(:,n)+h/2*phi(t(n),u(:,n),h/2,f,par);
    phi2=phi(t(n)+h/2,yn1,h/2, f,par);
    phi3=phi(t(n),u(:,n),h, f, par);
    ERR=(1/(1-1/2^p))*norm(1/2*(phi1+phi2)-phi3);
    if ERR<TOL && h>hmin
    u=[u,Z];
    t=[t,t(n)+h];
    n=n+1;
    ERROR=[ERROR,ERR];
    H=[H,h];
    elseif h<hmin
        disp('Paso muy pequeño')
        break
    elseif ERR>=TOL
    rechazo=rechazo+1;
    end
    h=min(hmax,h*min(facmax,fac*(TOL/ERR)^(1/p)));
end