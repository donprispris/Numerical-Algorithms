  %
A = [[1,2,3];[4,5,6];[7,8,10]] ;
%
b = [1,2,4]';
%
tam_A = size(A);
%
n = tam_A(1);
%
B = [A(:,:),b];
%
for k = 1:n-1
    %
    % Se busca el renglón con el valor absoluto máximo en la columna k
    %
    [v_max,r_max] = max(abs(B(k:n,k)));
    %
    % intercambio
    %
    t_r_max    = B(r_max,:);
    B(r_max,:) = B(k,:);
    B(k,:)     = t_r_max;
    %
    % Volviendo 1 el valor de la diagonal
    %
    B(k,:) = B(k,:)/B(k,k);
    %
    % reduciendo los elementos de abajo de la diagonal
    %
    for r = k+1:n
        B(r,:) = B(r,:) - B(r,k) * B(k,:)
    end
end
%
% pivoteo hacia atrás para obtener los valores de las incógnitas
%
for k = n:-1:2
    B(1:k-1,n+1) = B(1:k-1,n+1) - B(1:k-1,k) * B(k,n+1);
end
s = B(:,n+1);
fmts = ['Solución transpuesto: [', repmat('%g, ', 1, numel(s)-1), '%g]\n'];
fprintf(fmts, s)
%
% verificando
%
v_sol = A * s - b;
fmtv = ['verificando transpuesto: [', repmat('%g, ', 1, numel(v_sol)-1), '%g]\n'];
fprintf(fmtv,v_sol)
%
% =========================================================================
%                         Fin del código
% =========================================================================
