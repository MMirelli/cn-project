function z = diagonale(D, z)
% z = diagonale(D, z)
%
% Risolve il sistema lineare avente per matrice dei coefficienti una
% matrice D diagonale e per vettore dei termini noti il vettore z.
%
% Input:
%   D - vettore contenente la diagonale della matrice
%   z - vettore dei termini noti
%
% Precondizioni:
%   Il vettore D deve avere tutti elementi ~= 0
%
% Output:
%   z - vettore soluzione del sistema lineare associato
n = length(D);
for i = 1:n
    if D(i) == 0
        error("diagonale:NotDiagonal", ...
              "Precondizione violata: " + ...
              "il vettore D deve avere tutti elementi ~= 0");
    end
    z(i) = z(i) / D(i);
end
return