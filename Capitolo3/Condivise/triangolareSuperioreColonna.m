function y = triangolareSuperioreColonna(U, y)
% y = triangolareSuperioreUnitariaColonna(U, y)
%
% Risolve il sistema lineare avente come matrice dei coefficienti 
% la matrice U triangolare superiore e come vettore dei termini 
% noti y. Il sistema viene risolto per colonne.
%
% Input:
%   U - matrice dei coefficienti
%   y - vettore dei termini noti
%
% Precondizioni:
%   U matrice triangolare superiore
%
% Output:
%   y - vettore soluzione del sistema lineare associato
n = size(U, 1);
for j = n:-1:1
    if U(j,j) == 0
        perror('Matrice non triangolare superiore');
    end
    y(j) = y(j) / U(j,j);
    y(1:j-1) = y(1:j-1) - U(1:j-1,j)*y(j);
end
return