function [t,u]=midiffin(pqr,t0,tfin,a,b,C1,C2,N)
%CASO 1
if C1==0 && C2==0
h=(tfin-t0)/(N+1);
ts=(t0+h:h:tfin-h);

A=zeros(N);
A(1,1)=2+h^2*feval(pqr{2},ts(1));
A(1,2)=-(1-h/2*feval(pqr{1},ts(1)));
A(N,N)=2+h^2*feval(pqr{2},ts(N));
A(N,N-1)=-(1+h/2*feval(pqr{1},ts(N)));
for i=2:N-1
    A(i,i)=2+h^2*feval(pqr{2},ts(i));
    A(i,i-1)=-(1+h/2*feval(pqr{1},ts(i)));
    A(i,i+1)=-(1-h/2*feval(pqr{1},ts(i)));
    %A(i,i+1)=A(i,i-1)-2; %Curiosamente si pongo esto diverge.
end
r=zeros(N,1);
for i=1:N
    r(i)=feval(pqr{3},ts(i));
end
    aux=zeros(N,1);
    aux(1)=(1+h/2*feval(pqr{1},ts(1)))*a;
    aux(N)=(1-h/2*feval(pqr{1},ts(N)))*b;
    B=-h^2*r+aux;
    X=A\B;
    u=[a;X;b];
    t=[t0,ts,tfin];
%CASO 2. Neumann Se pude generalizar fácilmente a tipo Robin.
elseif C1==1 && C2==1
h=(tfin-t0)/(N+1);
t=(t0:h:tfin);

A=zeros(N+2);
A(1,1)=2+h^2*feval(pqr{2},t(1));
A(1,2)=-2;
A(N+2,N+2)=2+h^2*feval(pqr{2},t(N+2));
A(N+2,N+1)=-2;
for i=2:N+1
    A(i,i)=2+h^2*feval(pqr{2},t(i));
    A(i,i-1)=-(1+h/2*feval(pqr{1},t(i)));
    A(i,i+1)=-(1-h/2*feval(pqr{1},t(i)));
end
r=zeros(N+2,1);
for i=1:N+2
    r(i)=feval(pqr{3},t(i));
end
aux=zeros(N+2,1);
aux(1)=-(1+h/2*feval(pqr{1},t(1)))*a;
aux(N+2)=(1-h/2*feval(pqr{1},t(N+2)))*b;
B=-h^2*r+2*h*aux;
u=A\B;
%CASO 3
elseif C1==0 && C2==1
h=(tfin-t0)/(N+1);
ts=(t0+h:h:tfin);

A=zeros(N+1);
A(1,1)=2+h^2*feval(pqr{2},ts(1));
A(1,2)=-(1-h/2*feval(pqr{1},ts(1)));
A(N+1,N+1)=2+h^2*feval(pqr{2},ts(N+1));
A(N+1,N)=-2;
for i=2:N
    A(i,i)=2+h^2*feval(pqr{2},ts(i));
    A(i,i-1)=-(1+h/2*feval(pqr{1},ts(i)));
    A(i,i+1)=-(1-h/2*feval(pqr{1},ts(i)));
end
r=zeros(N+1,1);
for i=1:N+1
    r(i)=feval(pqr{3},ts(i));
end
aux=zeros(N+1,1);
aux(1)=1/(2*h)*(1+h/2*feval(pqr{1},ts(1)))*a;
aux(N+1)=(1-h/2*feval(pqr{1},ts(N+1)))*b;
B=-h^2*r+2*h*aux;
X=A\B;
u=[a;X];
t=[t0,ts];

%CASO 4
elseif C1==1 && C2==0
h=(tfin-t0)/(N+1);
ts=(t0:h:tfin-h);

A=zeros(N+1);
A(1,1)=2+h^2*feval(pqr{2},ts(1));
A(1,2)=-2;
A(N+1,N+1)=2+h^2*feval(pqr{2},ts(N+1));
A(N+1,N)=-(1+h/2*feval(pqr{1},ts(N+1)));
for i=2:N
    A(i,i)=2+h^2*feval(pqr{2},ts(i));
    A(i,i-1)=-(1+h/2*feval(pqr{1},ts(i)));
    A(i,i+1)=-(1-h/2*feval(pqr{1},ts(i)));
end
r=zeros(N+1,1);
for i=1:N+1
    r(i)=feval(pqr{3},ts(i));
end
aux=zeros(N+1,1);
aux(1)=-(1+h/2*feval(pqr{1},ts(1)))*a;
aux(N+1)=1/(2*h)*(1-h/2*feval(pqr{1},ts(N+1)))*b;
B=-h^2*r+2*h*aux;
X=A\B;
u=[X;b];
t=[ts,tfin];


end
end
