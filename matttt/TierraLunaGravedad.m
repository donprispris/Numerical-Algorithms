clf
G = 6.67408E-11; %%  m3 kg-1 s-2
m=[5.9736E+24, 7.349E+22];
%
% cada m�vil en una columna
%
% r0=[[0;0;0],[6378000.0+108000.0;0;0]];
r0=[[0;0;0],[ 4.224400625146314e+07;0;0]] %[3.832557907001450e+08;0;0]];
v0=[[0;0;0],[0;0;3.072070826337914e+03]] %[0;1.019927755507821e+03;0],[]];
deltaT=1*60;  %% cada minuto
%Nk=1+2*60*60/deltaT; 
Nf = 28*24*60*60/deltaT; % un ciclo de la luna
Nk=4000
pos=zeros(Nk+1,6);
pos(1,:)=[r0(:,1)',r0(:,2)'];
%
%  para crear el espacio para el vector unitario en la direcci�n de la
%  fuerza, la fuerza y la aceleraci�n (vectoriales)
%
u = r0;
F = r0;
a = r0;
dr= r0;
%
% Variables para iterar
%
r = r0;
v = v0;
for t=1:Nk,
  %
  % vector de diferencias de posiciones entre el m�vil 1 al m�vil 2
  %
  dr = r(:,2) - r(:,1);
  %
  % distancia al cuadrado
  %
  dr2 = dr' * dr;
  %
  % Vector unitario de m�vil 1 al m�vil 2
  %
  u = dr / sqrt(dr2);
  %
  % Fuerza de gravedad
  %
  F = (G * m(1)*m(2)/dr2) * u;
  %
  % Aceleraci�n de cada m�vil
  %
  a = [F / m(1), - F / m(2)]; 
  %
  % Velocidad
  %
  v = v + a * deltaT;
  %
  % Posici�n
  %
  r = r + v * deltaT;
  %
  % Guardo la posici�n
  %
  pos(t+1,:) = [r(:,1)',r(:,2)'];
  %
  %
  %
  %S = sprintf('pos: %12.2f,%12.2f  vel: %12.2f,%12.2f Fza: %12.2f,%12.2f Acel: %12.2f,%12.2f', ...
  %            r(1,2),r(2,2),v(1,2),v(2,2),-F(1,1),-F(2,1),a(1,2),a(2,2));
  %disp(S);
                
end

plot3(pos(:,1),pos(:,2),pos(:,3),'o',pos(:,4),pos(:,5),pos(:,6)'.')