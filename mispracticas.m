%Práctica 3
%x=miecdiferenciasbis(1/3,1/3,20);
%Hasta aquí todo bien, pero si itero más veces los efectos de redondeo se
%hacen notables y se va
%x=miecdiferenciasbis(1/3,1/3,50);

%f=@funccorazon; x0=[0;2]; t0=0; tfin=2*pi; N=1000; itmax=10; par=[];

%f=@funcvanderpol; x0=[0.1;0.2]; t0=0; tfin=10; N=1000; par=[1;1];

%Práctica 8
%f=@rigida; x0=0; t0=0; tfin=pi/2; N=100; par=[];
%Cambiamos N=25,40,50,100,200,1000; 

%Práctica 9
%f=@funcpendulo; x0=[0.2;0.2]; t0=0; tfin=10; N=1000; par=[0;9.8;1;0];
%Cambiamos x0=[pi;0] por ej; B=0.25, 1.5

%f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; N=1000; par=[0;9.8;1;0];
%Cambiamos x0=[0;2] por ej; B=0.25, 1.5

%Práctica 10
%f=@funcdeppresa; x0=[30;50]; t0=0; tfin=100; N=1000; par=[0.4;0.01;0.3;0.005];
%Se va para x0=[1;1]

%f=@funccompet; x0=[1;1]; t0=0; tfin=100; N=1000; par=[1;1;1; 0.2; 0.4; 0.0001];

%f=@funcvanderpol; x0=[-2;0]; t0=0; tfin=100; N=1000; par=[1; -0.2];

%f=@funcduffling; x0=[1;1]; t0=0; tfin=100; N=1000; par=1;

%f=@funclorenz; x0=[0;5;75]; t0=0; tfin=35; N=10000; par=[10;100.5;8/3];

%Práctica 11
%f=@funcvanderpol; x0=[2;8]; t0=0; tfin=100; N=8000; par=[30; 1]; itmax=10;
%Actualizar jac

%Práctica 12
%f=@funbelza; x0=[0.25;0.75;0.25]; t0=0; tfin=1; N=100000; itmax=100; par=[2e4;8e-4;5e3;0.75];
%Si pongo t0=1 o mayor hay cosas raras: mirk4 y euler da una zona coloreada,
%mi trap va bien. Si subo las iteraciones va bien.

%Práctica 13,14,15
%Práctica 16.
%f=@funcpendulo; x0=[-pi+10^-5;0]; t0=0; tfin=16; N=1000; par=[0;9.8;1;0];
%f=@funcvanderpol; x0=[2;8]; t0=0; tfin=100; N=800000; par=[30; 1];
%Probando diría que, menos eficaz a más eficaz,
%milne<miab4<euler<mirk4; por ejemplo probar en pendulo con N=70.

%Práctica 17
%f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; N=1000; par=[0;9.8;1;0];
%f=@funclorenz; x0=[0;2;0]; t0=0; tfin=35; N=50000; par=[10;28;8/3];
%f=@funbelza; x0=[0.25;0.75;0.25]; t0=0; tfin=0.1; N=10000; par=[2e4;8e-4;5e3;0.75];

%Práctica 18
%No va demasiado bien pero va
%f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; N=100000; par=[0;9.8;1;0];
%f=@funclorenz; x0=[0;2;0]; t0=0; tfin=35; N=100000; par=[10;28;8/3];
%f=@funbelza; x0=[0.25;0.75;0.25]; t0=0; tfin=0.1; N=400000; par=[2e4;8e-4;5e3;0.75];

%Práctica 19
%f=@funcpendulo; x0=[-pi+10^-5;0]; t0=0; tfin=16; N=1000; par=[0;9.8;1;0];
%las oscilaciones desaparecen con respecto a Milne
%f=@funbelza; x0=[0.25;0.75;0.25]; t0=0; tfin=0.1; N=1000000; par=[2e4;8e-4;5e3;0.75];
%Mirar lo de las oscilaciones. Mientras que Milne divergía, aquí aparecen
%oscilaciones.

%Práctica 20
%No me converge pero por lo visto es normal, euler tiene un orden muy bajo
%y como hay que hacer muchos cálculos en cada iteración se va.
%phi=@phieuler; p=2; f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; par=[0;9.8;1;0]; h0=0.01; hmin=0.001; hmax=0.5; TOL=10^-3;
%h toma valores excesivamente pequeños. El ERR es
%demasiado grande (sobre todo en la primera iteracion) y hace tender h a cero.
%phi=@phirk4; p=4; f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; par=[0;9.8;1;0]; h0=0.01; hmin=0.001; hmax=0.1; TOL=10^-5;

%Práctica 21
%phiin=@phieuler; p=1; phiex=@phirk4; f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; par=[0;9.8;1;0]; h0=0.01; hmin=0.001; hmax=0.1; TOL=10^-3;
%phiin=@phieuler; p=1; phiex=@phirk4; f=@func23_1; x0=1; t0=0; tfin=2; h0=0.0001; hmin=0.00005; TOL=10^-4; par=[]; hmax=0.01; 
%Tenemos el mismo problema



%Práctica 22
%f=@funcpendulolin; x0=[0.2;0.2]; t0=0; tfin=10; par=[0;9.8;1;0]; h0=0.01; hmin=0.001; hmax=0.1; TOL=10^-7;

%f=@funbelza; x0=[0.25;0.75;0.25]; t0=0; tfin=0.1; par=[2e4;8e-4;5e3;0.75]; h0=0.001; hmin=0.00001; hmax=0.01; TOL=10^-5;
%paso muy pequeño

%Práctica 23
%f=@func23_1; x0=1; t0=0; tfin=2; N=10000; par=[];
%Método de paso constante (mirk4) me da la gráfica de la discontinuidad
%Método adaptativo (mirkf) me da paso muy pequeño
%f=@func23_1; x0=1; t0=0; tfin=2; h0=0.05; hmin=0.0001; TOL=10^-5; par=[];
%f=@func23_2; x0=1; t0=0; tfin=10; N=10000; par=[];
%Discontinuidad en x=2.3 mas o menos
%f=@func23_2; x0=1; t0=0; tfin=3; h0=0.01; hmin=0.0001; hmax=0.5; TOL=10^-5; par=[];
%Paso muy pequeño

%Práctica 24
%f=@funcosil; x0=1/exp(1); t0=0; tfin=8; N=10000; par=[];
%f=@funcosil; x0=1/exp(1); t0=0; tfin=8; h0=0.01; hmin=0.0001; TOL=10^-5; par=[];
%Para el último apartado véase practica24.m

%Práctica 25
%midisplin

%Práctica 26
%pqr={@(t) 0*t,@(t) 4+0*t,@(t) -4*t}; t0=0; tfin=1; C1=0; C2=0; a=0; b=2; N=1000; TOL=0.01;
%pqr={@(t) 3+0*t,@(t) 2+0*t,@(t) 3*cos(t)};  t0=0; tfin=1; C1=0; C2=1; a=-1; b=1; N=1000; TOL=0.01;
%pqr={@(t) 0*t,@(t) cos(t),@(t) 1*t};  t0=0; tfin=5; C1=1; C2=0; a=-2; b=-1; N=1000; TOL=0.01;
%pqr={@(t) 1-sin(t),@(t) cos(t),@(t) sin(t)}; t0=0; tfin=10; C1=1; C2=1; a=-2; b=-1; N=1000; TOL=0.01;

%Práctica 27 y 28
%ffxfy={@(t,x,y) 2*x^3 ,@(t,x,y) 6*x^2 ,@(t,x,y) 0*t};  t0=1; tfin=2; C1=0; C2=0; a=1/2; b=1/3; N=1000; TOL=0.01;
%h=(tfin-t0)/N; t=(t0:h:tfin);  sol=1./(1+t);

%ffxfy={@(t,x,y) 8*x^3 ,@(t,x,y) 24*x^2 ,@(t,x,y) 0*t};  t0=0; tfin=1; C1=0; C2=1; a=1/3; b=-2/25; N=1000; TOL=0.01;
%h=(tfin-t0)/N; t=(t0:h:tfin);  sol=1./(3+2*t);
%El siguiente no sale pero por lo visto no es fallo mio
%ffxfy={@(t,x,y) (-t*y+x+t)^3+1/t ,@(t,x,y) 3*(-t*y+x+t)^2  ,@(t,x,y) -3*t*(-t*y+x+t)^2};  t0=1; tfin=exp(1); C1=1; C2=0; a=1; b=exp(1); N=1000; TOL=0.001;
%h=(tfin-t0)/N; t=(t0:h:tfin);  sol=t.*log(t);

%ffxfy={@(t,x,y) -(y)^2+x+t ,@(t,x,y) 1 ,@(t,x,y) -2*y};  t0=1; tfin=2; C1=1; C2=1; a=0; b=2; N=1000; TOL=0.01;

%Práctica 29
%ffxfy={@(t,x,y) (2*sin(t^2)+8*t^2)*x-4*t^2*x*log(x)+2*t*sin(t^2)*y ,@(t,x,y) -4*t^2*log(x) + 4*t^2 + 2*sin(t^2) ,@(t,x,y) 2*t*sin(t^2)};  t0=0; tfin=(10.5*pi)^(1/2); C1=0; C2=0; a=exp(1); b=exp(2); N=1000; TOL=0.01;
%h=(tfin-t0)/N; t=(t0:h:tfin);  sol=exp(2-cos(t.^2));
%el resultado es muy preciso

%Práctica 30
%ffxfy={@(t,x,y) 1000*(x^3-x), @(t,x,y) 1000*(3*x^2-1), @(t,x,y) 0}; t0=0; tfin=5; C1=1; C2=1; a=0; b=0; N=1000; TOL=0.001; 
%Para lambda=1, me sale una línea recta para S=0
%Me diverge hacia infinito para S entre 0.01 y 0.99. Para S=0 y S=1 linea recta
%Idem menos infinito con valores negativos de S
%Para lambda=0 línea recta. Para lambda grandes es igual que para lambda=1
%pero diverge mucho antes. 

%No hay un buen dato inicial para el caso 4 en dispnolin. Mirar un poco
%cual puede ser en función del problema

%Práctica 31, 32
%Repetir práctica 26 con testmidiffin, los resultados son muy parecidos.
%Notar que con diferencias finitas se hace una iteracion más que en el
%disparo.
%Para las tipo Robin es simplemente añadir como variable de entrada alpha
%beta, y construir sobre el caso C1=1, C2=2. Es muy fácil.

%Entregable MT
%x0=[1;0;0;1]; tfin=7; par=[1;0]; %Órbitas cerradas
%x0=[1;0;0;1.4]; tfin=1000; par=[1;0]; %Órbita elíptica
%x0=[1;0;0;1]; tfin=10; par=[1;0.1]; %Al principio orbita pero acaba escapando
%x0=[1;0;0;1]; tfin=20; par=[1;-0.1]; %Órbita interesante
%x0=[1;0;0;1]; tfin=110; par=[1;0.01]; %Órbita prácticamente cerrada, hacer
%RKF por si acaso
%x0=[1;0;0;1]; tfin=2; par=[0.1;1]; %Es una parábola ligeramente desviada (hacer gráfica para comparar).
%x0=[1;0;0;1]; tfin=2; par=[0;1];
%x0=[1;0;0;1]; tfin=20; par=[1;0.1]; %Órb1
%x0=[5;-1;5;-1]; tfin=20; par=[1;-0.001]; %Órb2
%x0=[0;0;2;0]; tfin=20; par=[1;-0.26]; %Órb2
%x0=[1;0;0;0.5]; tfin=; par=[1;0.01];



%f=@funchamilton; x0=x0; t0=0; tfin=tfin; N=10000; par=par; h0=0.01; hmin=0.0000001; hmax=0.1; TOL=10^-5;

%midiffinolin
%f=@(t,x,y) (1-sin(t))*y+cos(t)*x+sin(t); t0=0; tfin=10; a=-2; b=-1; N=10;
%mirar fsolve para que te resuelva funciones que dependan de parámetros.
%Aquí ejemplo sencillo 
%f=@(x,a) x+a; a=2; fval=@(x) f(x,a); x=fsolve(fval,0);
%pqr={@(t) 0*t,@(t) 4+0*t,@(t) -4*t}; t0=0; tfin=1; C1=0; C2=0; a=0; b=2; N=1000; TOL=0.01;
%f=@(t,x,y) 0*y+4*x-4*t; t0=0; tfin=1; a=0; b=2; N=400;
%Sale del estilo pero no sale bien
%f=@(t,x,y) 2*x^3;  t0=1; tfin=2; a=1/2; b=1/3; N=100; 



%práctica ANEP 2 prueba
alpha=2; pqr={@(t) 0*t+alpha,@(t) 0*t,@(t) 0*t}; t0=0; tfin=1; a=0; b=1; N=1000; C1=0; C2=0;






















