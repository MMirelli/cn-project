function x = triangolareInferioreUnitariaColonna(A, x)
% x = triangolareInferioreUnitariaColonna(A, x)
%
% Risolve il sistema lineare Ax=b (il vettore x viene trascritto 
% sul vettore b) dove A e' una matrice triangolare inferiore a 
% diagonale unitaria. Il sistema e' risolto per colonne.
%
% Input:
%   A - matrice dei coefficienti
%   x - vettore dei termini noti
%
% Precondizioni:
%   A matrice con diagonale unitaria
%
% Output:
%   x - vettore soluzione del sistema lineare Ax=b sovrascritto nel
%       vettore dei termini noti
n = length(x);
for i = 1:n
    x(i+1:n) = x(i+1:n) - A(i+1:n, i)*x(i);
end
return