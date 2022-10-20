%Esteban Cárdenas

%creamos los astros
%nombre,masa,radio
%masa en 
Tierra=Astro('Tierra',5.9736E+24,6.371)
Apolo=Astro('Apolo1',2155,.1)

%%===================definimos la orbita del Geostatica====================
%condiciones iniciales
%parametros de planetas

%orbita geocentrica
altitude=35.786 %meter
x0=Tierra.radio+altitude
y0=0
z0=0
xdot0=0
inclination=pi/2-23.5*pi/180;
semi_eje=norm([x0;y0;z0])
periodo= 2*pi/sqrt(Tierra.mu)*semi_eje^(3/2)

vcircular=((2*pi*semi_eje*1000)/periodo)/1000         %(2*pi*semi_eje*1000)/periodo%sqrt(Tierra.mu/semi_eje)
ydot0=vcircular*sin(inclination);
zdot0=vcircular*cos(inclination)
%condiciones iniciales
estado_inicial=[x0;y0;z0;xdot0;ydot0;zdot0];




%period= 2*pi/sqrt(Tierra.mu)*semi_eje^(3/2)
numOrbitas=1;
tspan=[0 periodo*numOrbitas]

%aqui integramos la ecuacion de movimiento
[tout,stateout]=ode45(@FuncResolver, tspan,estado_inicial);
%extramos los vectores de estado del radio
xout=stateout(:,1)
yout=stateout(:,2)
zout=stateout(:,3)


%Hacemos la tierra

%plot 3D orbita
fig=figure()
set(fig,'color','white')
plot3(xout,yout,zout,'b-','LineWidth',2)
grid on
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
hold on


axis equal
axis([-60 60 -60 60 -40 40])



%definimos la tierra
[x y z]= sphere
r=Tierra.radio
s=surf(r*x,r*y,r*z);
direction=[1,0,0];
rotate(s,direction,23.5)
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')


%for i=1:length(xout)
%    s=surf(xout(i)+r*x,yout(i)+r*y,zout(i)+r*z);
%    pause(.05)
%end

