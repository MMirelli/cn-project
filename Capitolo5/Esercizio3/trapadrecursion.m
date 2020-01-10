function If_12 = trapadrecursion(a, fa, b, fb, fun, tol)
% If_12 = trapadrecursion(a, fa, b, fb, fun, tol)
% 
% Effettua la generica chiamata ricorsiva per il calcolo della 
% formula dei trapezi composita adattativa.
% 
% Input:
%   a - primo estremo di integrazione
%   fa - valore della funzione da approssimare nell'ascissa a,
%        questo parametro ha esclusivamente lo scopo di diminuire 
%        il numero di valutazioni di funzione nelle chiamate 
%        ricorsive
%   b - secondo estremo di integrazione
%   fb - valore della funzione da approssimare nell'ascissa b,
%        questo parametro ha esclusivamente lo scopo di diminuire 
%        il numero di valutazioni di funzione nelle chiamate 
%        ricorsive
%   fun - function handle funzione di cui si intende approssimare 
%         l'integrale definito nell'intervallo [a, b]
%   tol - limitazione ad una approssimazione dell'errore assoluto
% 
% Output:
%   If - approssimazione dell'integrale definito di fun in [a, b],
%        calcolato mediante la formula dei trapezi composita 
%        adattativa
If_1 = (b-a)/2 * (fa+fb);
mid = (a+b) / 2;
fmid = fun(mid);  % unica nuova valutazione di funzione
If_12 = If_1/2 + (b-a)/2*fmid;

% se l'errore stimato e' maggiore della tolleranza
% effettuo la ricorsione su [a, (a+b)/2] e [(a+b)/2, b]
% con tolleranza dimezzata
if abs(If_1 - If_12)/3 > tol
    If_12 = trapadrecursion(a, fa, mid, fmid, fun, tol/2) + ...
        trapadrecursion(mid, fmid, b, fb, fun, tol/2); 
    % al ritorno dalla ricorsione sommo le approssimazioni trovate
end
return;