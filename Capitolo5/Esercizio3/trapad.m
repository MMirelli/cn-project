function If = trapad(a, b, fun, tol)
% If = trapad(a, b, fun, tol)
% 
% Calcola l'approssimazione dell'integrale definito di fun 
% nell'intervallo [a, b], usando la formula dei trapezi composita 
% adattativa.
% 
% Input:
%   a - primo estremo di integrazione
%   b - secondo estremo di integrazione
%   fun - function handle della funzione di cui si intende 
%         approssimare l'integrale definito nell'intervallo [a, b]
%   tol - limitazione ad una approssimazione dell'errore assoluto
% 
% Precondizioni:
%   a <= b
% 
% Output:
%   If - approssimazione dell'integrale definito di fun in [a, b]
%        calcolato mediante la formula dei trapezi composita 
%        adattativa
if b < a
    error('trapad:UnorderedIntegrationLimits', ...
          "Precondizione violata: a < b")
end

If = trapadrecursion(a, fun(a), b, fun(b), fun, tol);
% costo totale in termini di valutazioni funzionali: 
% 2 + 1*(numero di ricorsioni)
return;

