function x = triangolareInferioreUnitariaRiga(A, x)
% x = triangolareInferioreUnitariaRiga(A, x)
%
% Risolve il sistema lineare Ax=b (il vettore x viene trascritto 
% sul vettore b) dove A e' una matrice triangolare inferiore a 
% diagonale unitaria. Il sistema e' risolto per righe.
%
% Input:
%   A - matrice dei coefficienti
%   x - vettore dei termini noti
%
% Precondizioni:
%   A matrice con diagonale unitaria
%
% Output:
%   x - vettore soluzione del sistema lineare Ax=b
n = length(x);
for i = 1:n
    if A(i,i) ~= 1
        error('triangolareInferioreUnitariaRiga:NotDiagInfUni', ...
              "Precondizione violata: " + ...
              "la matrice A ha diagonale unitaria");
    end
    for j = 1:i-1
        x(i) = x(i) - A(i,j) * x(j);
    end
end
return