function nrec = trapadcont(a, b, fun, tol)
% If = trapadcont(a, b, fun, tol)
% 
% Calcola l'approssimazione dell'integrale definito di fun 
% nell'intervallo [a, b], usando la formula dei trapezi composita 
% adattativa. Restituisce il numero di chiamate ricorsive 
% effettuate.
nrec = trapadrecursioncont(a, fun(a), b, fun(b), fun, tol);
return;

