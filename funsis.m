function sis3=funsis(f,x,x0,xfin,N,a,b)
%Condiciones de contorno
h=(xfin-x0)/(N+1);
xs=(x0+h:h:xfin-h);

e = ones(N,1);
%D2hc
A1 = spdiags([e -2*e e],-1:1,N,N);
A1=full(A1)/h^2;

F=zeros(N,1);
for i=1:N
    F(i)=feval(f,xs(i));
end
F(1)=F(1)+a/h^2;
F(N)=F(N)+b/h^2;

sis3=A1.*x+F;
end
