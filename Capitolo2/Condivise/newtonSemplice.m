function x = newtonSemplice(f, f1, x0, rtolx, itmax)
% x = corde(f, f1, x0, rtolx[, itmax])
%
% Trova uno zero della funzione f con il metodo di Newton semplice.
% Stampa a video il numero di iterazioni e di valutazioni di 
% funzione effettuate.
%
% Input:
%   f - funzione di cui si desidera trovare lo zero
%   f1 - derivata prima della funzione f
%   x0 - ascissa di partenza per il metodo
%   rtolx - tolleranza relativa con cui approssimare lo zero di
%           funzione
%   [itmax] - numero massimo di iterazioni. Se non specificato
%             ne effettua 1000.
%
% Precondizioni:
%   [itmax] >= 1
%
% Output:
%   x - ascissa in cui la funzione f si annulla
if nargin == 4
    itmax = 1000;
end

if itmax < 1
        error("newtonSemplice:InvalidItmaxValue", ...
              "Precondizione violata: itmax >= 1")
end

iterazioni = 0;
valutazioni = 0;
itera = 1;
while (iterazioni < itmax) && itera 
    fx = f(x0);
    f1x = f1(x0);
    x = x0 - fx/f1x;
    iterazioni = iterazioni + 1;
    valutazioni = valutazioni + 2;
    itera = abs(x-x0) / (1+abs(x)) > rtolx;
    x0 = x;
end
if iterazioni == itmax
    warning("Tolleranza relativa non raggiunta, " + ...
            "numero di iterazioni effettuate: %d", itmax)
end
fprintf('Iterazioni: %d\n', iterazioni);
fprintf('valutazioni: %d\n', valutazioni);
return
