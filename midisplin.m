function  [t,u]=midisplin(pqr,t0,tfin,C1,C2,a,b,N,TOL)
%TOL?
%x=(v;u)=(v;v');
f1=@fundisplin1;
f2=@fundisplin2;
if C2==0
   if C1==0
   %Caso 1 x(t0)=a, x(T)=b
   [t,v1]=mirk4(f1,t0,tfin,[a;0],N,pqr);
   [~,v2]=mirk4(f2,t0,tfin,[0;1],N,pqr);
   else
   %Caso 2 x'(t0)=a, x(T)=b
   [t,v1]=mirk4(f1,t0,tfin,[0;a],N,pqr);
   [~,v2]=mirk4(f2,t0,tfin,[1;0],N,pqr);
   end
  %Tendremos que coger un valor aproximado por ser la solución numérica
  if abs(v2(1,N+1))>TOL 
    u=v1+((b-v1(1,N+1))/v2(1,N+1))*v2;
  else 
      if abs(v1(1,N+1)-b)<TOL
        display x=v1+sv2 con s arbitrario es solución
        display se da la solución para s=1
        u=v1+v2;
      else
        display no hay solución
      end
  end
else
   if C1==0
   %Caso 3 x(t0)=a, x'(T)=b
   [t,v1]=mirk4(f1,t0,tfin,[a;0],N,pqr);
   [~,v2]=mirk4(f2,t0,tfin,[0;1],N,pqr);
   else
   %Caso 4 x'(t0) x'(T)=b
   [t,v1]=mirk4(f1,t0,tfin,[0;a],N,pqr);
   [~,v2]=mirk4(f2,t0,tfin,[1;0],N,pqr);
   end
  if abs(v2(2,N+1))>TOL 
    u=v1+((b-v1(2,N+1))/v2(2,N+1))*v2;
  else 
    if abs(v1(2,N+1)-b)<TOL
        display x=v1+sv2 con s arbitrario es solución
        display se da la solución para s=1
        u=v1+v2;
    else
        display no hay solución
    end
  end
end

