%Esteban Cárdenas
%------------------------------datos-----------------------------
%**************radio de la orbita de la luna respecto a la tierra*****
al=384.400; % radio horizontal
bl=384.400; % radio Vertical
%radio de la luna en metros respecto a la tierra
radioMetrosLuna=al*10E+5
%******radio de la orbita del satelite apolo respecto a la tierra*****
as=42.164; % radio horizontal
bs=42.164; % radio Vertical
%radio del satelite Apolo en metros respecto a la tierra
radioMetrosSatelite=as*10E+5
%radio de transferencia
aTr=(al+as)/2
%radio de la lunacon satelite
aLS=11
%********************masas de los astros******************************
masaTierra=5.9736E+24
masaLuna=7.349E+22
masaApolo=2155
G=6.67408E-11

%*******************Calculamos los periodos en dias*******************
periodoLuna=sqrt(((4*pi^2)/(G*(masaLuna+masaTierra)))*((radioMetrosLuna)^3))*(1/(3600*24))
periodoSatelite=sqrt(((4*pi^2)/(G*(masaApolo+masaTierra)))*((radioMetrosSatelite)^3))*(1/(3600*24))
%suponemos que queremos llegar a la orbita lunar en un periodo de 4 dias
periodoTransf=4
%creamos una delta para que cata fotograma cada .001(pause) segundos sea un octavo de dia
deltaLuna=periodoLuna/2
deltaSatelite=periodoSatelite/2


%********************velocidad orbital de los astros*********************
% se mide en km/s
vcLuna=((2*pi*al*1000)/periodoLuna)/86400
vcApolo=((2*pi*as*1000)/periodoSatelite)/86400
%Hacemos los calculos para la tranferencia de calculamos las velocidades de cambio para estar en orbita
v1Cambio=((2*pi*aTr*1000)/periodoTransf*2)/86400

anguloLa=180-(360*(periodoTransf)/periodoLuna)


%calculamos el periodo para la transferencia hohman
%periodoHohmann=sqrt(((4*pi^2)/(G*(masaApolo+masaTierra+masaLuna)))*(((radioMetrosLuna)/2)^3))*(1/(3600*24))
%periodoHohmann=sqrt((6.9E-9)*(((al*1000+as*1000)/2)^3))
periodoHohmann=sqrt((((0.00256955529+0.00028184893)/2)^3))
%****************ponemos a la tierra en (0,0)************************
xT=0;
yT=0;
%-----------------------Orbita de la Luna---------------------------
%calculamos las partes del angulo deacuerdo al periodo
%entonces el angulo de la orbita sera dividida en 28 partes
%angulol=-4*((anguloLa*pi)/180):pi/(periodoLuna*4):+4*((anguloLa*pi)/180);
%angulol=-((5*pi)/4):pi/(periodoLuna*4):((pi)/4);
angulol=-(((anguloLa*pi)/180)+2*pi/4):pi/(periodoLuna*4):(((anguloLa*pi)/180)+pi);
xl=xT+al*cos(angulol);
yl=yT-bl*sin(angulol);
%calculamos los puntos que tenemos en x
n=length(xl)
%----------------------Orbita del satelite-----------------------
%orbita al rededor de la tierra
anguloTe=-pi:.001:pi;
xTe=xT+as*cos(anguloTe);
yTe=yT+bs*sin(anguloTe);

%orbita hohman
angulos=-pi:pi/(periodoTransf*4):pi;
xs=-(aTr-as)-aTr*cos(angulos);
ys=-0+aTr*sin(angulos);

%calculamos los puntos que tenemos en x
n2=length(xs)
sateliteEnOrbita=false
aux=0
%Graficamos la luna y la tierra
for i=1:n
    
    %orbita satelite alrededor de la luna 
    %Orbita de la Luna
    t=-100*pi:pi/(periodoTransf*4):100*pi;
    xln=xl(i)+aLS*cos(t); 
    yln=yl(i)+aLS*sin(t);
    %Orbita luna animacion
    t2=-10*pi:0.01:10*pi;
    xln2=xl(i)+aLS*cos(t2); 
    yln2=yl(i)+aLS*sin(t2);
    
    plot(xT,yT,'ob','MarkerSize',10,'MarkerFaceColor','c') %Tierra fijo
    hold on
    plot(xl,yl,'b') %orbita de la luna
    hold on
    plot(xl(i),yl(i),'or','MarkerSize',4,'MarkerFaceColor','k') %tierra moviendose en su orbita
    hold on
    plot(xln,yln,'b') %tierra moviendose en su orbita
    hold on
    plot(xTe,yTe,'b') %tierra moviendose en su orbita
    hold on
    %Graficamos satelite tierra
    plot(xs,ys,'b','MarkerSize',.001) %orbita satelite
    hold on
    
    %graficamos al satelite en su orbita de transferencia hasta que llegue
    %a la orbita de la luna
     if i<=n2
        if atan(yl(i)/xl(i)) < abs(atan(ys(i)/xs(i))) && sateliteEnOrbita==false
            plot(xs(i),ys(i),'or','MarkerSize',3,'MarkerFaceColor','k') %tierra moviendose en su orbita
            aux=i
            hold on
        else

            if i==1
                sateliteEnOrbita=false
            else
               sateliteEnOrbita=true 
            end

        plot(xln2(i*100),yln2(i*100),'or','MarkerSize',3,'MarkerFaceColor','k') %tierra moviendose en su orbita
        hold on
        end 
     else
        sateliteEnOrbita=false
        if atan(yl(i)/xl(i)) < abs(atan(ys(i-n2)/xs(i-n2))) && sateliteEnOrbita==false
            plot(xs(aux+6+i-n2),ys(aux+6+i-n2),'or','MarkerSize',3,'MarkerFaceColor','k') %tierra moviendose en su orbita
            hold on
        end 
    end
    
    
    %plot(xs(i),ys(i),'or','MarkerSize',3,'MarkerFaceColor','k') %tierra moviendose en su orbita
    grid on
    hold off
    axis([-500 500 -500 500])
    pause(.1)
    %pause(1.5)


end
