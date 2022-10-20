x=[0,5,10,15,20];
y=[5.028064763,-5.028064763,5.028064763,-5.028064763,5.028064763];

 xq=0:0.25:20;
 vq2 = interp1(x,y,xq,'cubic');
 plot(x,y,'o',xq,vq2,':.');

 title('Interpolación mediante splines cúbicos ');        % dibujamos el polinomio