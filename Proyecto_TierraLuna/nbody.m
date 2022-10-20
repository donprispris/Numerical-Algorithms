% - - n-body - - 
% Parameters
n  = 50;                                               
m  = 1000*rand(1,n);                     
x  = (rand(3,n)-2*rand(3,n));     
v  = zeros(3,n); 
dt = .00005; 
% Graphics
fig = figure( ...
    'color', [.5, .5, .7], ...
    'menubar', 'none', ...
    'numbertitle', 'off', ...
    'name', 'n-body');                             
ax = axes( ...
    'clipping','off', 'box', 'on',      'ticklength',[0,0], ...
    'xticklabel',[],  'yticklabel',[],  'zticklabel',[], ...
    'xlim', [-4,4],   'ylim', [-4,4],   'zlim', [-4,4], ...
    'xgrid', 'on',    'ygrid', 'on',    'zgrid', 'on', ...
    'color',[0,0,0],  'gridcolor',[1,1,0]); 
for e = 1:n                                            
    planets(e) = line( ...
         'marker', 'o', ...
         'markersize', m(e)/100, ...
         'markerfacecolor', rand(1,3));
end
% Loop
tic;
while toc < 10
    view(10*toc,30);                                 
    planets = plotUpdate(planets,x);                    
    [x,v]   = dataUpdate(x,v,m,dt);                    
    pause(.01); 
end
% Plot Update Function
function planets = plotUpdate(planets,x)             
    for e = 1:length(x)
        set(planets(e), ...
            'XData',x(1,e), ...
            'YData',x(2,e), ...
            'ZData',x(3,e));
    end
end
% Data Update Function 
function [x,v] = dataUpdate(x,v,m,dt)                   
    for i = 1:length(x)                                   
        a(:,i) = zeros(3,1);
        for j = 1:length(m)                                 
            if i ~= j
                a(:,i) = a(:,i) + ...
                    m(j).*(x(:,j)-x(:,i))./(norm(x(:,j)-x(:,i))^3+.5);
            end
            v(:,i) = v(:,i) + a(:,i)*dt;
            x(:,i) = x(:,i) + v(:,i)*dt;
        end
    end
end