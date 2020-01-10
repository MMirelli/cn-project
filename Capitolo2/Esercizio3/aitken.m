function x = aitken(f, f1, x0, rtolx, itmax)
% x = newtonModificato(f, f1, x0, rtolx[, itmax])
% 
% Calcola radice, di molteplicita' ignota, della funzione f, e 
% derivata prima f1. Elabora e stampa a video il numero di 
% iterazioni e valutazioni necessarie.
% 
% Input:
%   f - funzione di cui si intende calcolare radice
%   f1 - derivata prima di f
%   x0 - punto di innesto del metodo
%   rtolx - errore relativo
%   [itmax] - numero di iterazioni massime impiegabili del metodo
% 
% Precondizioni:
%   [itmax >= 1] 
% 
% Output:
%   x - radice di f
if nargin <= 4
    itmax = 1000;
end

if itmax <= 0
    error("newtonModificato:InvalidItmaxValue", ...
          "Precondizione violata: itmax >= 1");
end

iterazioni = 0;
valutazioni = 0;
x = x0;
itera = 1;
while itera && iterazioni < itmax
    x0 = x;
    fx = feval(f, x0);
    f1x = feval(f1, x0);
    x1 = x0 - fx/f1x;
    fx = feval(f, x1);
    f1x = feval(f1, x1);
    x = x1 - fx/f1x;
    % potrebbe accadere che le approssimazioni 
    % effettuate nel calcolo di differenze malcondizionate causino 
    % cancellazioni numeriche che rendono x = x1 = x0
    if x - 2*x1 + x0 ~= 0
        x = (x*x0 - x1^2)/(x - 2*x1 + x0);
    end
    iterazioni = iterazioni + 1;
    valutazioni = valutazioni + 4;
    itera = abs(x -x0)/(1+abs(x)) > rtolx;
end
if itera
    warning("Tolleranza relativa non raggiunta, " + ... 
            "numero di iterazioni effettuate: %d", iterazioni)
end
fprintf('Iterazioni: %d\n', iterazioni);
fprintf('Valutazioni: %d\n', valutazioni);
return