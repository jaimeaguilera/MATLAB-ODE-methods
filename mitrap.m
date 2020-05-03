function [t,u,numfun]=mitrap(f,t0,tfin,x0,N,par,itmax)
m=size(x0);
m=m(1);
h=(tfin-t0)/N;
t=(t0:h:tfin);
u=zeros(m,N+1);
numfun=0;
u(:,1)=x0;
for n=1:N
    j=0;
    W=ones(m,1);
    normW=norm(W);
    Z=u(:,n)+h*f(t(n),u(:,n),par);
    while j<itmax && normW>h^3
        G=Z-(u(:,n)+h/2*f(t(n),u(:,n),par)+h/2*f(t(n+1),Z,par));
        DG=eye(m)-h/2*jac(t(n+1),Z,par);
        W=DG^(-1)*G;
        %W=DG\G;
        normW=norm(W);
        Z=Z-W;
        j=j+1;
        numfun=numfun+2;
    end
    u(:,n+1)=Z; 
end


