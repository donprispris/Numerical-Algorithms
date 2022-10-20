%% Ejer_01
%% Obtener las raices (p/q) de un complejo.

syms x
%
%% 1^(3/4)
%
p1   = 3;
q1   = 4;
z1   = 1;
solq1 = eval(solve(x^q1-z1));
solq1

solpq1 = solq1.^p1;
solpq1
%
%% i^(2/3)
%
p2   = 2;
q2   = 3;
z2   = i;
solq2 = eval(solve(x^q2-z2));
solq2

solpq2 = solq2.^p2;
solpq2

