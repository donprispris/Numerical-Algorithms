%Esteban Cardenas 179150

datos=importdata("Tray.mat");
%i) Grafique t vs X, t vs Y y X vs Y;
t=datos{:,1};
xa=datos{:,2};
y=datos{:,3};
plot(t,xa)
hold on
grid on
plot(t,y)
plot(xa,y)
legend("t vs x","t vs y","x vs y")
%ii) Considere un vector para Xp del tamaño de X y lo mismo para Yp.
Xp=xa;
Yp=y;
%iii) Agregue el Xp los 4 primeros valores de X, lo mismo para Yp.
comienzo=1
fin=4
Xp=xa(comienzo:fin,1)
Yp=y(comienzo:fin,1)
%iv) Para cada coordenada obtenga cada uno de los puntos interpolados de manera sucesiva
%con los últimos 4 puntos. i.e. el valor de X(t=5) con X(t=1), X(t=2), X(t=3) y X(t=4), para
%Y(t=5) con Y(t=1), Y(t=2), Y(t=3) y Y(t=4). Los valores extrapolados serán (Xp(5),Yp(5)).
%Una vez que se tiene este par, actualice el cálculo para incorporar el punto X(t=5) para
%el cálculo de las X’s y lo mismo para el cálculo de las Y’s. tendrá ahora el cálculo con los
%valores de X(t02), X(t=3), X(t=4) y X(t=5). Lo mismo para la serie de Y. Obtenga ahora
%Xp(t=6) y Yp(t=6). Proceda sucesivamente con el siguiente punto.

%Variables
n=4
t_dato=[0,1,2,3]
t_datoY=[0,1,2,3]
n_ultimo=t_dato(4)
n_ultimoY=t_datoY(4)
matriz_aux=zeros(3,3)
matriz_auxY=zeros(3,3)
%-------------------------------------------------------------------------------------------------
%programa para interpolar por medio del metodo de newton en conjuntos de 4 elementos para la variable X
matrizX_imagen=zeros(50,1)
%llenamos los primeros 4 valores
matrizX_imagen(1)=Xp(1,1)
matrizX_imagen(2)=Xp(2,1)
matrizX_imagen(3)=Xp(3,1)
matrizX_imagen(4)=Xp(4,1)

for j=5:50
    %llenamos la primera columna de la matriz de aux
    for i=1:n-1
        matriz_aux(i,1)=(Xp(i+1)-Xp(i))/(t_dato(i+1)-t_dato(i))
    end
    %llenamos la segunda columna de la matriz de aux
    for i=1:n-2   
        matriz_aux(i+1,2)=(matriz_aux(i+1,1)-matriz_aux(i,1))/(t_dato(i+2)-t_dato(i))
    end
    %llenamos la tercera colmna
    for i=1:n-3   
        matriz_aux(i+2,3)=(matriz_aux(i+2,2)-matriz_aux(i+1,2))/(t_dato(i+3)-t_dato(i))
    end
    %creamos el polinomio
    syms x
    h(x)= Xp(1)+matriz_aux(1,1)*(x-t_dato(1))+matriz_aux(2,2)*(x-t_dato(1))*(x-t_dato(2))+matriz_aux(3,3)*(x-t_dato(1))*(x-t_dato(2))*(x-t_dato(3))
    matrizX_imagen(j,1)=h(j)
    

    %cambiamos de Xp y Yp y tiempo
    t_dato=[n_ultimo-2,n_ultimo-1,n_ultimo,n_ultimo+1]
    n_ultimo=t_dato(4)
    Xp=matrizX_imagen((j-3):j)
end
%la matriz X resultante no se asemeja a las variables reales de x ya que para
%que tengamos una buena interpolacion, necesitamos un numero de puntos
%espaciados de la funcion
%Entonces si usamos los puntos criticos de la funcion obtenemos una mejor
%interpolacion
x=[0,50,100,150,200];
yau=[5.028064763,-4.969840587,5.015619289,-5.010145616,4.9610013];

 xq=0:0.25:200;
 vq1 = interp1(x,yau,xq,'cubic');
 plot(xq,vq1,':.');

     
%------------------------------------------------------------------------------------------------------------- 
%%programa para interpolar en conjuntos de 4 elementos para la variable Y
matrizY_imagen=zeros(50,1)
%llenamos los primeros 4 valores
matrizY_imagen(1)=Yp(1,1)
matrizY_imagen(2)=Yp(2,1)
matrizY_imagen(3)=Yp(3,1)
matrizY_imagen(4)=Yp(4,1)

for j=5:50
    %llenamos la primera columna de la matriz de aux
    for i=1:n-1
        matriz_auxY(i,1)=(Yp(i+1)-Yp(i))/(t_datoY(i+1)-t_datoY(i))
    end
    %llenamos la segunda columna de la matriz de aux
    for i=1:n-2   
        matriz_auxY(i+1,2)=(matriz_auxY(i+1,1)-matriz_auxY(i,1))/(t_datoY(i+2)-t_datoY(i))
    end
    %llenamos la tercera colmna
    for i=1:n-3   
        matriz_auxY(i+2,3)=(matriz_auxY(i+2,2)-matriz_auxY(i+1,2))/(t_datoY(i+3)-t_datoY(i))
    end
    %creamos el polinomio
    syms x
    g(x)= Yp(1)+matriz_auxY(1,1)*(x-t_datoY(1))+matriz_auxY(2,2)*(x-t_datoY(1))*(x-t_datoY(2))+matriz_auxY(3,3)*(x-t_datoY(1))*(x-t_datoY(2))*(x-t_datoY(3))
    matrizY_imagen(j,1)=h(j)
    

    %cambiamos de Xp y Yp y tiempo
    t_datoY=[n_ultimoY-2,n_ultimoY-1,n_ultimoY,n_ultimoY+1]
    n_ultimoY=t_datoY(4)
    Yp=matrizY_imagen((j-3):j)
end
%la matriz Y resultante no se asemeja a las variables reales de x ya que para
%que tengamos una buena interpolacion, necesitamos un numero de puntos
%espaciados de la funcion
%Entonces si usamos los puntos criticos de la funcion obtenemos una mejor
%interpolacion
x=[0,25,75,125,175,200];
ya=[-0.037157287,2.997539302,-2.941176233,3.005033654,-3.019631845,-0.223025331];

 xq=0:0.25:200;
 vq2 = interp1(x,ya,xq,'cubic');
 
% v) Grafique t vs X y t vs Xp en una gráfica.
%vi) Grafique t vs Y y t vs Yp en una gráfica.
%vii) Grafique X vs Y y Xp vs Yp en una gráfica.
 plot(xq,vq2,':.');
 plot(vq1,vq2)
 title('Interpolación cúbica '); 
legend("t vs x","t vs y","x vs y","t vs x Interpolada","t vs y Interpolada","x vs y Interpolada")







