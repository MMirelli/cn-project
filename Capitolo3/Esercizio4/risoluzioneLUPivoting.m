function x = risoluzioneLUPivoting(A, b, p)
% x = risoluzioneLUPivoting(A, b, p)
%
% Risolve il sistema lineare Ax=b, dove A e' una matrice 
% fattorizzata con il metodo di LU pivoting.
%
% Input:
%   A - matrice dei coefficienti
%   b - vettore dei termini noti
%   p - vettore delle permutazioni della fattorizzazione LU 
%       pivoting di A
%
% Output:
%   x - vettore soluzione del sistema lineare associato
n = length(b);    
Pb = b;

% cambia la posizione degli elementi del vettore dei termini noti
for i = 1:n
    if i ~= p(i)
        Pb(i) = b(p(i));
    end 
end

% risolvi il sistema lineare
y = triangolareInferioreUnitariaColonna(A, Pb);
x = triangolareSuperioreColonna(A, y);
end 