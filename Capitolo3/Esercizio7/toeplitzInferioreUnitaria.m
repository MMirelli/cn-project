function b = toeplitzInferioreUnitaria(alpha, b)
% b = toeplitzInferioreUnitaria(alpha, b)
% 
% Calcolo della soluzione di una matrice di Toeplitz bidiagonale 
% inferiore a diagonale unitaria, caratterizzata da elementi 
% costanti pari ad alpha disposti nella sottodiagonale.
% 
% Input:
%   alpha - coefficiente che caratterizza la sottodiagonale 
%           inferiore
%   b - termine noto
% 
% Output:
%   b - soluzione del sistema toepliz(alpha)x = b
n = length(b);
for i = 2:n
    b(i) = b(i) - b(i-1)*alpha;
end
return