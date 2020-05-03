function x=miecdiferencias(x0,x1,N)
x=zeros(1,N+1);
x(1)=x0;
x(2)=x1;
for i=1:N-1
    x(i+2)=4*x(i+1)-3*x(i);   
end
n=(1:1:N+1);
plot(x,n)
end
