function y = lagrange(xi, fi, x)
% y = lagrange(xi, fi, x)
%
% Calcola il polinomio in forma di Lagrange nelle ascisse x.
%
% Input:
%   xi - vettore contenente le ascisse d'interpolazione
%   fi - vettore contenenete i valori assunti dalla funzione nelle 
%        ascisse d'interpolazione
%   x - vettore delle ascisse in cui calcolare il polinomio di 
%       Lagrange
%
% Precondizioni:
%   length(xi) == length(fi)
%
% Output:
%   y - valore assunto dal polinomio di Lagrange
if length(xi) ~= length(fi)
    error('lagrange:InterpolationNodesNumberMismatch', ...
          "Precondizione violata: length(xi) == length(fi)");
end

n = length(xi) - 1;
y = 0;
for i = 1 : n+1 
    l = l_kn_x(i, xi, x); % calcolo dell'(i-1)-esimo
    y = y + l.*fi(i);   % valutazione del polinomio
end
return


