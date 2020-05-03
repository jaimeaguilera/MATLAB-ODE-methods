function u=miecdiferenciasbis(x0,x1,N)
u=zeros(1,N+1);
u(1)=x0;
u(2)=x1;
x=[u(1);u(2)];
for i=1:N-1
    u(i+2)=feval(@funcecdif,x);
    x=[u(i+1), u(i+2)];
    %Se podría escribir directamente funcedif(x)
end
k=(1:1:N+1);
plot(k,u);
end
