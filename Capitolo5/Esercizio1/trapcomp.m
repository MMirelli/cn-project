function If = trapcomp(n, a, b, fun)
% If = trapcomp(n, a, b, fun)
%
% Calcola la formula composita dei trapezi su n+1 ascisse 
% equidistanti nell'intervallo [a,b], relativa alla funzione 
% implementata da fun.
%
% Input:
%   n - numero di sottointervalli
%   a - estremo inferiore
%   b - estremo superiore
%   fun - function handle della funzione di cui approssimare 
%         l'integrale
%
% Precondizioni:
%   a <= b
%   n > 0 - si assume che il caso n = 1 sia comunque accettabile, 
%           benche' la formula risultante, in questo caso, non sia 
%           composita
%
% Output:
%   If - approssimazione dell'integrale con la formula composita 
%        dei trapezi
errMsg = "Precondizione violata: ";
if b < a
    error('trapcomp:UnorderedIntegrationLimits', errMsg + "a <= b")
elseif n <= 0
        error('trapcomp:InvalidNumberOfSubintervals', ...
              errMsg + "n > 0")
end

xi = linspace(a,b,n+1);
If = fun(a)/2 + fun(b)/2;
If = (b-a)/n * (If + sum(fun(xi(2:end-1))));

return

