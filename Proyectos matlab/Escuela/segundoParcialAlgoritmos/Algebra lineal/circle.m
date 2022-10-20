function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
syms x
sol = eval(solve(x^5-1024));
plot(sol)
grid on

hold off


