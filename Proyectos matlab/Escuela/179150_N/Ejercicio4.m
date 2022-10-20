%queremos sacar un polinomio que interpoleMatriz Hesiana
%Esteban Cardenas 179150
%datos
datos=6;
k=[0:datos-1];
Zk=[0,0,1,1,2,2];
Fzk=[0,0,1,1,0,0];
FDe=[0,(Fzk(3)-Fzk(2))/(Zk(4)-Zk(2)),0,(Fzk(5)-Fzk(4))/(Zk(5)-Zk(4)),0];
F2=zeros(1,4)
for i=1:4
    F2(i)=(FDe(i+1)-FDe(i))/(Zk(i+2)-Zk(i));
end
F3=zeros(1,3)
for i=1:3
    F3(i)=(F2(i+1)-F2(i))/(Zk(i+2)-Zk(i));
end
F4=zeros(1,2);
for i=1:2
    F4(i)=(F3(i+1)-F3(i))/(Zk(i+4)-Zk(i));
end
F5=[(F4(2)-F4(1))/(Zk(6)-Zk(1))];


%sacamos la matriz hesiana
syms x
h(x)=Fzk(1)+FDe(1)*(x-Zk(1))+F2(1)*(x-Zk(1))*(x-Zk(2))+F3(1)*(x-Zk(1))*(x-Zk(2))*(x-Zk(3))+F4(1)*(x-Zk(1))*(x-Zk(2))*(x-Zk(3))*(x-Zk(4))+F5(1)*(x-Zk(1))*(x-Zk(2))*(x-Zk(3))*(x-Zk(4))*(x-Zk(5))
%evaluamos, la derivada de la hesiana es 8x-12x^2+4x^3
der(x)=8*x-12*x^2+4*x^3

evalNormal=[h(0),h(1),h(2)]
evalDerivada=[der(0),der(1),der(2)]
%como vemos lo datos son por los que deberia de pasar



