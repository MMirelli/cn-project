function fi = differenzeDivise(xi, fi, m)
% fi = differenzeDivise(xi, fi[, m])
%
% Calcola i coefficienti del polinomio di Newton interpolante una 
% funzione nei punti fi, con ascisse di interpolazione xi.
%
% Input:
%   xi - vettore delle ascisse di interpolazione
%   fi - vettore dei punti di interpolazione
%   [m] - grado del polinomio
%
% Precondizioni:
%   length(xi) == length(fi)
%
% Output:
%   fi - coefficienti del polinomio di interpolazione rispetto 
%        alla base di Newton
if length(xi) ~= length(fi)
    error('differenzeDivise:InterpolationNodesNumberMismatch', ...
          "Precondizione violata: length(xi) == length(fi)");
end

n = length(xi); % numero di ascisse interp
if nargin <= 2
    % grado del polinomio e' pari a ((numero di ascisse interp)-1)
    m = n - 1;
end
for j = 1 : m
    for i = n : -1 : j+1
        fi(i) = (fi(i) - fi(i-1)) / (xi(i) - xi( i- j));
    end
end

end