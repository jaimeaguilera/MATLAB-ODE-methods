function  [t,X]=midispnolin(ffxfy,t0,tfin,C1,C2,a,b,N,TOL)
%x=(v;w;z;u)=(v;v';z;z'). Se quiere hallar v cumpliendo v(T)=b.
%Dudas al adaptar el algoritmo a otros valores iniciales

f=@fundispnolin;
k=1;
if C2==0
    %Caso 1: x(t0)=a; x(T)=b;
    if C1==0
    S=(b-a)/(tfin-t0);  
    [t,x]=mirk4(f,t0,tfin,[a;S(k);0;1],N,ffxfy);
    while abs(x(1,N+1)-b)>TOL 
    s=S(k)-(x(1,N+1)-b)/x(3,N+1); 
    S=[S,s];
    k=k+1;
    [t,x]=mirk4(f,t0,tfin,[a;S(k);0;1],N,ffxfy);
    end
    %Caso 2: x'(t0)=a, x(T)=b
    else
    S=b-a*(tfin-t0);
    [t,x]=mirk4(f,t0,tfin,[S(k);a;0;1],N,ffxfy);
    while abs(x(1,N+1)-b)>TOL 
    s=S(k)-(x(1,N+1)-b)/x(3,N+1); 
    S=[S,s];
    k=k+1;
    [t,x]=mirk4(f,t0,tfin,[S(k);a;0;1],N,ffxfy);
    end
    end
else
    %Caso 3: x(t0)=a, x'(T)=b 
    if C1==0
    S=b;
    [t,x]=mirk4(f,t0,tfin,[a;S(k);0;1],N,ffxfy);
    while abs(x(2,N+1)-b)>TOL 
    s=S(k)-(x(2,N+1)-b)/x(4,N+1); 
    S=[S,s];
    k=k+1;
    [t,x]=mirk4(f,t0,tfin,[a;S(k);0;1],N,ffxfy);
    end
    %Caso 4, x'(t0)=a, x'(T)=b
    else
    S=b;
    %Tomar distintos datos iniciales
    [t,x]=mirk4(f,t0,tfin,[S(k);a;0;1],N,ffxfy);
    while abs(x(2,N+1)-b)>TOL 
    s=S(k)-(x(2,N+1)-b)/x(4,N+1); 
    S=[S,s];
    k=k+1;
    [t,x]=mirk4(f,t0,tfin,[S(k);a;0;1],N,ffxfy);
    end
    end
end
X=x(1,:);