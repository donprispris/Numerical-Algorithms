
function dstatedt=satelite(t,state)
%stateinitial=[x0;y0;z0;xdot0;ydot0;zdot0];
G=6.67E-11
%x=state(1)
%y=state(2)
%z=state(3)

%xdot=state(4)
%ydot=state(5)
%zdot=state(6)

%Inertia and mass
m=2.6 %kilograms
%kinematics
vel=state(4:6)
%gravity model
r= state(1:3)%r=[x,y,z]
rhat=r/norm(r);
rnorm=norm(r)
Fgrav=-(G*5.972E24*m/rnorm^2)*rhat

%Dinamics
F=Fgrav
vel= state(4:6)
acel= F/m
dstatedt= [vel;acel]