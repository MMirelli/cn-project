function nrec = simpadcont(a, b, fun, tol)
% nrec = simpadcont(a, b, fun, tol)
% 
% Calcola l'approssimazione dell'integrale definito di fun 
% nell'intervallo [a, b], usando la formula di Simpson composita 
% adattativa. Restituisce il numero di chiamate ricorsive 
% effettuate
fEval = [fun(a) fun((a+b)/2) fun(b)];
nrec = simpadrecursioncont(a, b, fun, tol, fEval);
return;

