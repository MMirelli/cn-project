function If = simpcomp(n, a, b, fun)
% If = simpcomp(n, a, b, fun)
%
% Calcola l'approssimazione dell'integrale definito di fun su 2*n+1 
% ascisse equidistanti nell'intervallo [a, b], usando la formula di 
% Simpson composita.
%
% Input:
%   n - numero di polinomi interpolanti fun in [a, b], usati per
%       l'approssimazione del rispettivo integrale definito
%   a - primo estremo di integrazione
%   b - secondo estremo di integrazione
%   fun - function handle della funzione di cui si intende 
%         approssimare l'integrale definito nell'intervallo [a, b]
%
% Precondizioni:
%   a <= b
%   n > 0 - si assume che il caso n = 1 sia comunque accettabile, 
%           benche' la formula risultante, in questo caso, non sia 
%           composita
%
% Output:
%   If - approssimazione dell'integrale definito di fun in [a, b],
%        calcolato mediante la formula di Simpson composita
errMsg = "Precondizione violata: ";
if b < a
    error('simpcomp:UnorderedIntegrationLimits', errMsg + "a <= b")
elseif(n <= 0)
    error('simpcomp:InvalidNumberOfPolynomials', errMsg + "n > 0")
end

xi = linspace(a, b, 2*n+1);
If = fun(a)+fun(b); % 2 val
% 2*(n-1) valutazioni
If = If + (4*sum(fun(xi(2:2:end-1))) + 2*sum(fun(xi(3:2:end-2)))); 
                                   
% valutazioni totali: 2 + 2*(n-1) = 2*n+1
If = If * ((b-a)/(6*n));
return