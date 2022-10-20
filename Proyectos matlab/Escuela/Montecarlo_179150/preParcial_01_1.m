% =========================================================================
%                  prueba de graficado de líneas
% =========================================================================

XY_centro_elipse = [0.5,0];
AB_Elipse        = [1.5,1];

XY_Circulo = [0.5,1];
R_Circulo  = 0.5;

N_puntos = 1000;

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
%
% obtenga el valor de p
% p = ...
%fprintf("P: %f\n",p)
%
xd = DC.*DE.*x;
yd = DC.*DE.*y;
plot(xc,yc,xe,ye,cuadro(1,:),cuadro(2,:),xd,yd,'+k')

% =========================================================================
%         Fin del código
% =========================================================================