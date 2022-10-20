

%Orbita de la Luna
at=384.4; % radio horizontal
bt=384.4; % radio Vertical
%ponemos a la tierra en (0,0)
x0t=0;
y0t=0;
%hacemos el periodo de la orbita
t=-4*pi:0.01:4*pi;
xt=x0t+at*cos(t);
yt=y0t+bt*sin(t);
%calculamos los puntos que tenemos en x
n=length(xt)

%Traslación de la luna sobre la tierra


for i=1:1:n
        xt2=xt(i); %posicion de la tierra
        yt2=yt(i); %centro de la luna
        al=38.1575; % horizontal radius *100
        bl=38.0744275597; % vertical radius *100
        %Orbita de la Luna
        x0l=xt2-0.025165; % x0,y0 ellipse centre coordinates foco
        y0l=yt2;
        t=-111*pi:0.01:111*pi;
        xl=x0l+al*cos(t); 
        yl=y0l+bl*sin(t); 
        m=length(xl);
        xs=2.4991665;%posicion del sol
        ys=0;
        xm=xl(m-14*i);
        ym=yl(m-14*i);
        pts=(yt(i)-ys)/(xt(i)-xs);
        plt=(ym-yt(i))/(xm-xt(i));
       
        plot(xl,yl,'m') %orbita de la luna
        hold on
        plot(xl(m-14*i),yl(m-14*i),'ok','MarkerSize',5,'MarkerFaceColor','w') %luna moviendose en su orbita
        hold on
        plot(xt,yt,'k') %orbita de la tierra
        hold on
        plot(xt(i),yt(i),'ob','MarkerSize',10,'MarkerFaceColor','c') %tierra moviendose en su orbita
        hold on
        plot(xs,ys,'or','MarkerSize',20,'MarkerFaceColor','y') %sol fijo
        porcentaje=(pts-plt)/((pts+plt)/2);
        per=abs(porcentaje);
        if per<0.1
            line([xt(i) xs],[yt(i) ys])
            line([xm xt(i)],[ym yt(i)])
            hold off
            vector(i)=i;
        end    
        hold off
        axis([-500 500 -500 500])
        pause(.00000000000001)
end