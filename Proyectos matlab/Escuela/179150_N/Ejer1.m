%ejerciocio1
%Esteban Cardenas 179150
% i)Obtenga los complejos correspondientesa la potencia 3/4 de 1.
syms x
sol=eval(solve(x^4-1^3));
% ii)Obtenga los complejos correspondientesa la potencia -2/3 de i.
z=0+1i;
a=real(z);
b=imag(z);
angulo=atan(b/a);
r=(a^2+b^2)^(1/2);
r2=(r)^(-2/3);
%hacemos la matriz donde estaran los valores
a=zeros(1,3);
m=2;
for k=0:m
    a(1,k+1)=r2*exp((i*angulo+2*k*pi)/3);
end