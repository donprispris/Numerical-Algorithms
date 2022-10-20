% Cálculo de geo-estacionaridad
% Dada la masa del planeta ( M1 ) y  T el periodo obtener:
% la distancia de giro y la velocida tangencial.
%
% La fuerza de gravedad debe ser contrarestada por la fuerza centrífuga
%
%  w  = 2 * pi / T
%  Fg  = Fcf
%  Fg  = G * M1 * Mm / r^2
%  Fcf = Mm * w^2 * r
%
% igualando:
%
%  G * M1 * Mm / r^2 = Mm * w^2 * r
%  r^3 = G * M1 / w^2
%
% r = ( G * M1 / w^2 )^(1/3)
%
% Datos:
%
G        = 6.67384E-11;
M_Tierra = 5.9736E+24; % Kg
M_Marte  = 6.4185E+23; % Kg
T_Tierra = 24;         % hrs
T_Marte  = 24.6229;    % hrs
%
% Inclinacion
%
alfa_Tierra = 23.44;   % grados
alfa_Marte  = 25.19;   % grados
%
w_Tierra = 2 * pi / ( T_Tierra * 3600);
w_Marte  = 2 * pi / ( T_Marte  * 3600);
%
r_geoEst_Tierra = ( G * M_Tierra / (w_Tierra^2) )^(1/3);
r_geoEst_Marte  = ( G * M_Marte  / ( w_Marte^2) )^(1/3);
%
vtg_Tierra      = w_Tierra * r_geoEst_Tierra;
vtg_Marte       = w_Marte  * r_geoEst_Marte;
%
%
fprintf('Posiciones estacionarias:\n');
fprintf('Tierra ... distancia: %12.6e mts, velocidad: %12.6e mts/seg\n',r_geoEst_Tierra,vtg_Tierra);
fprintf('Marte  ... distancia: %12.6e mts, velocidad: %12.6e mts/seg\n',r_geoEst_Marte,vtg_Marte);
%
% verificando (aceleraciones o "g's")
%
Fg_Tierra  = G * M_Tierra / r_geoEst_Tierra^2;
Fg_Marte   = G * M_Marte  / r_geoEst_Marte^2;
Fcf_Tierra = r_geoEst_Tierra * w_Tierra^2; 
Fcf_Marte  = r_geoEst_Marte  * w_Marte^2;
fprintf('Verificando (aceleraciones en mts/seg^2):\n');
fprintf('Tierra ... Gravitacional: %12.6e, Centrifuga: %12.6e\n',Fg_Tierra,Fcf_Tierra);
fprintf('Marte  ... Gravitacional: %12.6e, Centrifuga: %12.6e\n',Fg_Marte ,Fcf_Marte );
%
% Inclinaciones
%
alfa_Tierra_rads = pi * alfa_Tierra / 180.0;
vy_Tierra = vtg_Tierra * cos( alfa_Tierra_rads );
vz_Tierra = vtg_Tierra * sin( alfa_Tierra_rads );
%
alfa_Marte_rads = pi * alfa_Marte / 180.0;
vy_Marte = vtg_Marte * cos( alfa_Marte_rads );
vz_Marte = vtg_Marte * sin( alfa_Marte_rads );
%
fprintf('Velocidades por inclinacion del eje:\n');
fprintf('Tierra:[0.0,%12.6e,%12.6e]\n',vy_Tierra,vz_Tierra);
fprintf('Marte: [0.0,%12.6e,%12.6e]\n',vy_Marte, vz_Marte);

%
%   ================================= FIN DEL CODIGO ======================
%



