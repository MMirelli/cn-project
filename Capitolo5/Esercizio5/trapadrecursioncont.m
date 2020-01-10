function nrec = trapadrecursioncont(a, fa, b, fb, fun, tol)
% nrecr = trapadrecursioncont(a, fa, b, fb, fun, tol)
% 
% Effettua la generica chiamata ricorsiva per il calcolo della 
% formula dei trapezi composita adattativa. Restituisce il numero 
% di chiamate ricorsive effettuate.
If_1 = (b-a)/2 * (fa+fb);
mid = (a+b) / 2;
fmid = fun(mid);  % unica nuova valutazione di funzione
If_12 = If_1/2 + (b-a)/2*fmid;

if abs(If_1 - If_12)/3 > tol
    % se non ho ancora raggiunto la tolleranza richiesta effettuo 
    % le due chiamate ricorsive
    nrecLeft = trapadrecursioncont(a, fa, mid, fmid, fun, tol/2);
    nrecRight = trapadrecursioncont(mid, fmid, b, fb, fun, tol/2);
    % in totale eseguo due chiamate ricorsive + il numero di 
    % chiamate ricorsive effettuate dalle ricorsioni generate.
    nrec = 2 + nrecLeft + nrecRight;
else
    % se ho raggiunto la tolleranza non effettuo chiamate ricorsive
    nrec = 0;
end
return;

