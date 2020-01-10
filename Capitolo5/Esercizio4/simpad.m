function If = simpad(a, b, fun, tol)
% If = simpad(a, b, fun, tol)
% 
% Calcola l'approssimazione dell'integrale definito di fun 
% nell'intervallo [a, b], usando la formula di Simpson composita 
% adattativa.
% 
% Input:
%   a - primo estremo di integrazione
%   b - secondo estremo di integrazione
%   fun - function handle funzione di cui si intende approssimare 
%         l'integrale definito nell'intervallo [a, b]
%   tol - limitazione ad una approssimazione dell'errore assoluto
% 
% Precondizioni:
%   a <= b
% 
% Output:
%   If - approssimazione dell'integrale definito di fun in [a, b],
%        calcolato mediante la formula di Simpson composita 
%        adattativa.
if b < a
    error('simpad:UnorderedIntegrationLimits', ...
          "Precondizione violata: a <= b")
end

fEval = [fun(a) fun((a+b)/2) fun(b)]; % 3 valutazioni di fun
If = simpadrecursion(a, b, fun, tol, fEval);
% costo in termini di valutazioni funzionali: 
%     3 + 2*(numero di ricorsioni)
return;