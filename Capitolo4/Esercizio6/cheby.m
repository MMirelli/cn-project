function xi = cheby(n, a, b) 
% xi = cheby(n, a, b)
%
% Calcola le x_0, x_1, ..., x_n ascisse di Chebyshev in [a,b], la 
% cui scelta permette di minimizzare l'errore di interpolazione per 
% il polinomio di grado n, interpolante f(x) in (x_i, f(x_i)) 
% con i = 0, 1, ..., n. 
% 
% 
% Input:
%   n - grado del polinomio interpolante di cui si intende 
%       calcolare le ascisse di Chebyshev;
%   a - primo estremo dell'intervallo su cui si effettua il calcolo 
%       delle ascisse, t.c. data xi(i) (i-1)-esima ascissa di 
%       Chebyshev si ha xi(i) >= a per ogni i = 1, ..., n+1.
%   b - secondo estremo dell'intervallo su cui si effettua il 
%       calcolo delle ascisse, t.c. data xi(i) (i-1)-esima ascissa 
%       di Chebyshev si ha xi(i) <= b per ogni i = 1, ..., n+1.
%
% Output:
%   xi - vettore contenente le n+1 ascisse di Chebyshev calcolate.
%

xi = 0 : n; % alloco vettore xi = [ 0, 1, 2, ..., n ]
xi = cos(((2*xi+1) * pi) / (2*n+2));
% "traslazione" delle ascisse: [-1, 1]->[a, b]
xi = (a+b)/2 + (b-a)/2 * xi;

return;