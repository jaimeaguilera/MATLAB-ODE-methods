function phi=phirk4(t,x,h,f,par)

 K1=feval(f,t,x,par);
 K2=feval(f,t+h/2,x+h/2*K1,par);
 K3=feval(f,t+h/2,x+h/2*K2,par);
 K4=feval(f,t+h,x+h*K3,par);
 phi=1/6*(K1+2*K2+2*K3+K4);
 


