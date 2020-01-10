function x = secanti(f, f1, x0, rtolx, itmax)
% x = secanti(f, f1, x0, rtolx[, itmax])
%
% Trova uno zero della funzione f con il metodo delle secanti.
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
        error('secanti:InvalidItmaxValue', ...
              "Precondizione violata: itmax >= 2")
end

% prima iterazione (si applica Newton classico)
fx0 = f(x0);
x1 = x0 - fx0/f1(x0);

% seconda iterazione
fx1 = f(x1);
x = (fx1*x0 - fx0*x1) / (fx1 - fx0);
c = (x-x1)/(x1-x0);
itera = abs(x-x1) > (1-c)/c*rtolx;
x0 = x1;
fx0 = fx1;
x1 = x;

iterazioni = 2;
valutazioni = 3;

while (iterazioni < itmax) && itera
    fx1 = f(x);
    x = (fx1*x0 - fx0*x1) / (fx1 - fx0);
    iterazioni = iterazioni + 1;
    valutazioni = valutazioni + 1;
    c = (x-x1)/(x1-x0);
    itera = abs(x-x1) > (1-c)/c*rtolx;
    x0 = x1;
    fx0 = fx1;
    x1 = x;
end
if iterazioni == itmax
    warning("Tolleranza relativa non raggiunta, " + ...
            "numero di iterazioni effettuate: %d", itmax)
end
fprintf('Iterazioni: %d\n', iterazioni);
fprintf('valutazioni: %d\n', valutazioni);
end