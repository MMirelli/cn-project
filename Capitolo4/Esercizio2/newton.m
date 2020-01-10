function y = newton( xi, fi, x )
% y = newton( xi, fi, x )
% 
% Calcola il polinomio interpolante di grado n, in forma di Newton, 
% nelle ascisse indicate nel vettore x.
% 
% Input:
%   xi - vettore delle ascisse di interpolazione 
%   fi - vettore dei punti di interpolazione
%   x - vettore delle ascisse in cui si intende calcolare il 
%       polinomio interpolante
%   
% Precondizioni:
%   length(xi) == length(fi)
% 
% Output:
%   y -  vettore contenente le valutazioni del polinomio 
%        interpolante di grado n in forma di Newton.
if length(xi) ~= length(fi)
    error('newton:InterpolationNodesNumberMismatch', ...
          "Precondizione violata: length(xi) == length(fi)");
end

fi = differenzeDivise(xi, fi);

y = calcolaPolinomio(fi, x, xi);

return 