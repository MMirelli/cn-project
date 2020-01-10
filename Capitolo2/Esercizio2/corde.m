function x = corde(f, f1, x0, rtolx, itmax)
% x = corde(f, f1, x0, rtolx[, itmax])
%
% Trova uno zero della funzione f con il metodo delle corde.
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
%   [itmax] >= 2, perche' come criterio d'arresto viene utilizzata
%   la tolleranza relativa.
%
% Output:
%   x - ascissa in cui la funzione f si annulla
if nargin == 4
    itmax = 1000;
end

if itmax < 2
        error('corde:InvalidItmaxValue', ...
              "Precondizione violata: itmax >= 2")
end

phi = f1(x0);

% prima iterazione
fx = f(x0);
x1 = x0 - fx/phi;

% seconda iterazione
fx = f(x1);
x = x1 - fx/phi;
c = (x-x1)/(x1-x0);
itera = abs(x-x1) > (1-c)/c*rtolx;

iterazioni = 2;
valutazioni = 3;

while (iterazioni < itmax) && itera
    fx = f(x);
    x = x1 - fx/phi;     
    iterazioni = iterazioni + 1;
    valutazioni = valutazioni + 1;
    c = (x-x1) / (x1-x0);
    itera = abs(x-x1) > (1-c)/c*rtolx;
    x0 = x1;
    x1 = x;
end
if iterazioni == itmax
    warning("Tolleranza relativa non raggiunta, " + ...
            "numero di iterazioni effettuate: %d", itmax)
end
fprintf('Iterazioni: %d\n', iterazioni);
fprintf('Valutazioni: %d\n', valutazioni);
return