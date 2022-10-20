
%Orbita de la tierra
at=15000; % radio horizontal
bt=15000; % radio Vertical
radioMetrosSol=at*10E+5
radioUnidadesAstronomicas=1

%orbita de el satelite
%orbita geostacionaria 42164 km
al=42.164; % horizontal radius *100
bl=42.164; % vertical radius *100
radioMetrosSatelite=al*10E+5

%Ponemos a la tierra en (0,0)
x0t=0;
y0t=0;
%datos
G=6.67408E-11
%masa de los astros en kg
masaTierra=5.9736E+24
masaSol=1.989E+30
masaSatelite=2155
%calculamos el periodo de la tierra en dias
periodoTierra=sqrt(radioUnidadesAstronomicas^3)*365
periodoSatelite=sqrt(((4*pi^2)/(G*(masaSatelite+masaTierra)))*((radioMetrosSatelite)^3))*(1/(3600*24))

%calculamos las velocidades km/s
vcSatelite=((2*pi*al*1000)/periodoSatelite)/86400
vcTierra=((2*pi*at*1000)/periodoTierra)/86400

%hacemos el periodo de la orbita de la tierra
t=-4*pi:pi/periodoTierra:4*pi;
xt=x0t+at*cos(t);
yt=y0t+bt*sin(t);
%calculamos los puntos que tenemos en x
n=length(xt)

%Traslación de la Tierra sobre el sol


for i=1:1:n
        xt2=xt(i); %posicion de la tierra
        yt2=yt(i); %centro del satelite
        %Orbita del satelite
        x0l=xt2; 
        y0l=yt2;
        t2=-500*pi:pi/periodoSatelite:500*pi;
        xl=x0l+al*cos(t2); 
        yl=y0l+bl*sin(t2); 
        
        xs=0;%posicion del sol
        ys=0;

        %orbita satelite
        plot(xl,yl,'m') 
        hold on
        %satelite moviendos en su orbita
        plot(xl(i),yl(i),'ok','MarkerSize',2,'MarkerFaceColor','w') 
        hold on
        %orbita de la tierra
        plot(xt,yt,'k') 
        hold on
        %tierra moviendose
        plot(xt(i),yt(i),'ob','MarkerSize',3,'MarkerFaceColor','c') 
        hold on
        %sol
        plot(xs,ys,'or','MarkerSize',20,'MarkerFaceColor','y') 
       
        hold off
        axis([-16000 16000 -16000 16000])
        pause(.00000000000001)
end