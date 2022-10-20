
%Orbita de la tierra
at=42.164; % radio horizontal
bt=42.164; % radio Vertical
radioMetrosSatelite=at*10E+5

%Ponemos al satelite 23.44 grados
angulo=23.44
anguloRad=(angulo*pi)/180
x0t=0;
y0t=0;
%datos
G=6.67408E-11
%masa de los astros en kg
masaTierra=5.9736E+24
masaSatelite=2155
%calculamos el periodo de la tierra en dias
periodoSatelite=sqrt(((4*pi^2)/(G*(masaSatelite+masaTierra)))*((radioMetrosSatelite)^3))*(1/(3600*24))

%calculamos las velocidades km/s
vcSatelite=((2*pi*al*1000)/periodoSatelite)/86400

%hacemos el periodo de la orbita del satelite
t=-(pi*anguloRad):pi/(periodoSatelite*10):(pi*anguloRad+pi)
xt=x0t+at*cos(t);
yt=y0t+bt*sin(t);
%calculamos los puntos que tenemos en x
n=length(xt)

%Traslación de la Tierra sobre el sol


for i=1:1:n
       
        xs=0;%posicion tierra
        ys=0;


        %orbita de la tierra
        plot(xt,yt,'k') 
        hold on
        %tierra moviendose
        plot(xt(i),yt(i),'ob','MarkerSize',5,'MarkerFaceColor','w') 
        hold on
        %sol
        plot(xs,ys,'or','MarkerSize',20,'MarkerFaceColor','c') 
       
        hold off
        axis([-75 75 -75 75])
        pause(1)
end