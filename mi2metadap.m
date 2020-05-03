function [t,u,rechazo,ERROR,H,prueba]=mi2metadap(phiin,p,phiex,f,t0,tfin,x0,h0,hmin,hmax,TOL,par)
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
prueba=0;
while t(n)<tfin
    Z=u(:,n)+h*phiin(t(n),u(:,n),h,f,par);
    
    phi1=phiin(t(n),u(:,n),h, f,par);
    phi2=phiex(t(n),u(:,n),h, f,par);
    ERR=norm(phi2-phi1);
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
    prueba=[prueba,ERR];
    end
    h=min(hmax,h*min(facmax,fac*(TOL/ERR)^(1/p)));
end