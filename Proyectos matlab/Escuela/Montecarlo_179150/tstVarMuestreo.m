% =========================================================================
%                      Ensayos de Bernoulli
% =========================================================================
% Probabilidad para generar las muestras
%
p = 0.3;
%
% En una matriz de M renglones por N columnas guardamos los resultados 
% del muestreo de t * K valores. A(i,j) contiene la estimación de j*K
% valores. La columna contiene los resultados del muestreo con el mismo
% número de muestras, mismo que se incrementa para cada columna.
%
K = 20;
M = 50;
N = 70;
A = zeros(M,N);
for j = 1:N
    for i = 1:M
        A(i,j) = sum(rand(1,j*K) <= p );
    end
    A(:,j) = A(:,j)/(j*K);
end
plot(K*(1:N),A','+', K*(1:N),mean(A),'k', ...
     K*(1:N),std(A)+mean(A),'k',K*(1:N),-std(A)+mean(A),'k')
pause(6)
plot(K*(1:N),std(A),'+b',K*(1:N),sqrt(p*(1-p)./(K*(1:N))))
%
fprintf('Valores de p y sigma: %f %f\n',p,sqrt(p*(1-p)))
%
% El valor de la estimación directa de p es
%
pe_dto = mean(mean(A));
fprintf('Estimaión directa de p: %f\n',pe_dto)
%
sigma_dto = sqrt(pe_dto*(1-pe_dto));
fprintf('sigma_dto: %f\n',sigma_dto)
%
% Estimación de la desviación estándar del promedio
%
% El valor teórico es sigma * sqrt(K*(1:N))
%
sige = sum(std(A)./sqrt(K*(1:N)))/sum(1./(K*(1:N)));
%
fprintf('Estimación de sigma por medio de std(A):%f\n',sige)
%
% Y con ello estimamos el valor de p
%
pe = 0.5 * ( 1 - sqrt(1 - 4 * sige^2));
fprintf('Estimación de p:%f\n',pe)
%
%
