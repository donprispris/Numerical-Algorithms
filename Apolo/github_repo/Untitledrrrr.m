
%initial conditions
%get planet parameters
planet
%space station
altitude=254*1.6*1000 %meter
x0=R+altitude
y0=0
z0=0
xdot0=0
inclination=0;
semi_major=norm([x0;y0;z0])
vcircular=sqrt(mu/semi_major)
ydot0=vcircular*sin(inclination);
zdot0=vcircular*cos(inclination)
stateinitial=[x0;y0;z0;xdot0;ydot0;zdot0];


% need time window
semi_major=norm([x0;y0;z0])
period= 2*pi/sqrt(mu)*semi_major^(3/2)
number_of_orbits=1;
tspan=[0 period*number_of_orbits]

%this is where we integrate the ecuation of motion
[tout,stateout]=ode45(@satelite, tspan,stateinitial);
%extract the state vector
xout=stateout(:,1)
yout=stateout(:,2)
zout=stateout(:,3)

%make earth
[X,Y,Z]=sphere
X=X*R
Y=Y*R
Z=Z*R
%plot 3D orbit
fig=figure()
set(fig,'color','white')
plot3(xout,yout,zout,'b-','LineWidth',2)
grid on
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
hold on
surf(X,Y,Z,'EdgeColor','none')

