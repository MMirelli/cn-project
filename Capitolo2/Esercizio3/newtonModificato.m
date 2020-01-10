function x = newtonModificato(f, f1, m, x0, rtolx, itmax)
% x = newtonModificato(f, f1, m, x0, rtolx[, itmax])
% 
% Calcola radice, di molteplicita' m, della funzione f, e derivata 
% prima f1. Elabora e stampa a video il numero di iterazioni e 
% valutazioni necessarie.
% 
% Input:
%   f - funzione di cui si intende calcolare radice
%   f1 - derivata prima di f
%   m - molteplicita' della radice da calcolare
%   x0 - punto di innesto del metodo
%   rtolx - errore relativo
%   [itmax] - numero di iterazioni massime impiegabili del metodo
% 
% Precondizioni:
%   f1 derivata prima di f
%   m > 0
%   [itmax >= 1] 
% 
% Output:
%   x - radice di f
if nargin <= 5
    itmax = 1000;
end

errMsg = "Precondizione violata: ";
if m <= 0
    error("newtonModificato:InvalidMValue", errMsg + "m > 0");
elseif itmax <= 0
    error("newtonModificato:InvalidItmaxValue", ...
          errMsg + "itmax >= 1");
end

% Non si effettuano controlli sulla derivata poiche' il suo calcolo 
% potrebbe essere oneroso
x = x0;
iterazioni = 0;
valutazioni = 0;
itera = 1;
while itera && iterazioni <= itmax 
    x0 = x;
    fx = feval(f, x0);
    f1x = feval(f1, x0);
    x = x0 - m*fx/f1x;
    iterazioni = iterazioni + 1;
    valutazioni = valutazioni + 2;
    itera = abs(x -x0)/(1+abs(x)) > rtolx;
end
if itera
    warning("Tolleranza relativa non raggiunta, " + ... 
            "numero di iterazioni effettuate: %d", iterazioni)
end
fprintf('Iterazioni: %d;\n', iterazioni);
fprintf('valutazioni: %d;\n', valutazioni);
return