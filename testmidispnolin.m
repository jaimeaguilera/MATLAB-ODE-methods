mispracticas
[t,u]=midispnolin(ffxfy,t0,tfin,C1,C2,a,b,N,TOL);
exist sol var
if ans==1
plot(t,u,'r', t, sol, 'g')
else
plot(t,u,'r')
end
%Si quiero dibujar la diferencia, por ejemplo práctica 29
%Dif=u-sol;
%plot(t,Dif,'r')




