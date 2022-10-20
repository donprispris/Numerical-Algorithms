
[x y z]= sphere
r=4
s=surf(r*x,r*y,r*z);
direction=[1,0,0];
rotate(s,direction,23)
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')