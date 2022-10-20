% =========================================================================
%                 Programa base para el Parcial 01 ANC_202103
% =========================================================================


%calculamos el valor de N con cierta precision y probabilidad
%P TEORICA lo sacamos p=pi/4
%5.1
p=.7;
Precision= 1e-2;
Probabilidad=.95;
Zb=norminv(1-.5*(1-Probabilidad));

N_puntos=(Zb/Precision)^2*(p*(1-p));


XY_centro_elipse = [0.5,0];

AB_Elipse        = [1.5,1];

XY_Circulo = [0.5,1];
R_Circulo  = 0.5;



%
% Círculo
% 
t = 2*pi*(0:N_puntos)/N_puntos;
%
xc = R_Circulo * cos(t) + XY_Circulo(1);
yc = R_Circulo * sin(t) + XY_Circulo(2);
%
% Elipse
%
xe = AB_Elipse(1) * cos(t) + XY_centro_elipse(1); 
ye = AB_Elipse(2) * sin(t) + XY_centro_elipse(2);
%
% Parábola y = VPy + sqrt(x - VPx); x >= xcp
%
%VP       = [-0.0,0.0];

%cambiamos el centro
VP       = [-0.3,0.25];
longRama = 1.0;
xp       = VP(1) + longRama * (0.5 * N_puntos:-1:0)/(0.5*N_puntos);
yp       = VP(2) + [sqrt(xp - VP(1)), - sqrt(xp(0.5*N_puntos:-1:1) - VP(1))];
xp       = [xp,xp(0.5*N_puntos:-1:1)];
%
% Encuadre
%
cuadro = [[0,1,1,0,0];[0,0,1,1,0]];
%
% Se generan puntos aleatorios en (0,1) X (0,1)
%
Kj = 2000;
x = rand(1,Kj);
y = rand(1,Kj);
%
DC = (x-XY_Circulo(1)).^2 + (y-XY_Circulo(2)).^2 < R_Circulo^2;
DE = ((x-XY_centro_elipse(1))/AB_Elipse(1)).^2 + ...
     ((y-XY_centro_elipse(2))/AB_Elipse(2)).^2 <= 1;

DP = (y - VP(2)).^2 <= (x - VP(1));

%
% obtenga el valor de p
p=count()

%fprintf("P: %f\n",p)
%
xd = DC.*DE.*DP.*x;
yd = DC.*DE.*DP.*y;
plot(xc,yc,xe,ye,cuadro(1,:),cuadro(2,:),xp,yp,xd,yd,'+k')

% =========================================================================
%         Fin del código
% =========================================================================