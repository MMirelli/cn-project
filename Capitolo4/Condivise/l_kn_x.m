function l = l_kn_x(k, xi, x)
% l = l_kn_x(k, xi, x)
%
% Valuta, sulle ascisse x, il (k-1)-esimo coefficiente del 
% polinomio in forma di Lagrange di grado n, interpolante le 
% ascisse xi.
%
% Input:
%   k - indice del (k-1)-esimo coefficiente del polinomio in forma 
%       di Lagrange
%   xi - vettore delle ascisse di interpolazione
%   x - ascisse di valutazione del polinomio in forma di Lagrange
%
%  Precondizioni:
%   xi(i) ~= xi(j) per ogni i ~= j con i, j = 0, ..., n
%   k intero positivo
%
% Output:
%   l - valutazioni, effettuate su ascisse x, del k-esimo 
%       coefficiente del polinomio di Lagrange
errMsg = "Precondizione violata: ";
if length(xi) ~= length(unique(xi))
    error('l_kn_x:ManyEqualInterpolationNodes', ...
          errMsg + "xi(i) ~= x(j) per i ~= j")
elseif k <= 0
    error('l_kn_x:NotPositiveKIndex', ...
          errMsg + "indice k positivo")
end

n = length(xi) - 1;
l = 1;
for j = 1 : n+1
    if j ~= k
        l = l .* ((x-xi(j)) / (xi(k)-xi(j)));
    end
end
return