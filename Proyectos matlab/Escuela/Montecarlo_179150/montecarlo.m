%Monte carlo Para estimar el valor de pi
%Esteban Cardenas

%calculamos el valor de N con cierta precision y probabilidad
%P TEORICA lo sacamos p=pi/4
p=.7;
Precision= .01;
Probabilidad=.9;
Zb=norminv(1-.5*(1-Probabilidad));

N=(Zb/Precision)^2*(p*(1-p));


dentro=0;
for n=1:N
    X=rand(1,1)
    Y=rand(1,1)
    %usamos pitagoras como una condicional
    if sqrt(X^2+Y^2)<=1
        plot(X,Y,'r.');
        dentro=dentro+1;
    else
        %pintamos los puntos afuera del circulo
        plot(X,Y,'b.');
    end
    hold on;
end
hold off;
%valor de pi con la formula que sacamos
Pi_ex= 4*dentro/N;
fprintf('%8.4f\n',Pi_ex);


%podemos inferir que mientras mas puntos ocupemos, una mejor presicion,
%Podemos hacer este experimento con una matriz A

p=3.1416;
M=30;
N=50;
k=20;
A=zeros(M,N);
pr=0;
P_adentro=0;
for j=1:N
    for i= 1:M
            X=rand(1,j*k);
            Y=rand(1,j*k);
            
            A(i,j)=sum(sqrt(X.^2+Y.^2)<=1)*4/(j*k);

    end
end
plot(A','+');
plot(k*(1:N),A','+',k*(1:N),mean(A),'k')         
t=K*(1:N);
prom= mean(A);
desvStd=std(A);
plot(t,A','+',t,prom,'k',t,prom+desvStd,'k',t,prom-desvStd,'k')
s=sqrt(p*(1-p)./(k*(1:N)));
plot(t,desvStd,t,s);

%calculamos la interseccion entre dos fidura, dos circulos de radio .75
N=10000;
dentro=0;
for n=1:N
    X=rand(1,1)
    Y=rand(1,1)
    %usamos pitagoras como una condicional
    if sqrt(X^2+Y^2)<=.75 & sqrt(X^2+(Y-1)^2)<=.75
        plot(X,Y,'r.');
        dentro=dentro+1;
    else
        %pintamos los puntos afuera del circulo
        plot(X,Y,'b.');
    end
    hold on;
end
hold off;
%valor de pi con la formula que sacamos
Pi_ex= dentro/N;
fprintf('%8.4f\n',Pi_ex);


