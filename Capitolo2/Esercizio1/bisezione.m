function x = bisezione(f, a, b, tolx, itmax)
% x = bisezione(f, a, b, tolx[, itmax])
% 
% Calcola con tolleranza tolx, gli zeri della funzione f 
% nell'intervallo [a, b]. Elabora e stampa a video il numero di 
% iterazioni e valutazioni necessarie.
% 
% Input:
%   f - funzione di cui si intende calcolare gli zeri
%   a - primo estremo dell'intervallo
%   b - secondo estremo dell'intervallo
%   tolx - tolleranza ammessa per calcolo di soluzione
%   [itmax] - numero massimo di iterazioni
% 
% Precondizioni:
%   f continua
%   f function handle
%   f1 function handle
%   fa*fb <= 0
%   a <= b   
%   [itmax >= 2]
%   
% Output:
%   x - radice di f nell'intervallo [a, b]
errMsg = "Precondizione violata: ";
fa = feval(f,a);
fb = feval(f,b);
if(nargin <= 4)
    itmax = ceil(log2(b-a) - log2(tolx));
end
if(fa * fb > 0)
    error('bisezione:UncomputableSolution', errMsg + "fa*fb < 0");
elseif(itmax < 2)
    error('bisezione:InvalidItmaxValue', errMsg + "itmax >= 2");
end
x = (a+b)/2;
fx = feval(f,x);
iter = 1;
val = 3;
x0 = 0; x1 = 0; stop = 0;
for i=2:itmax
    iter = iter + 1;
    if i < 4
        stop = abs(fx) <= tolx*abs((fb-fa) / (b-a));
        if stop, break, end
    else
        c = abs(x - x1) / abs(x1 - x0);
        stop = abs(x-x1) <= (1-c)/c * tolx; 
        if stop, break, end
    end        
    if fa*fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
    x0 = x1; x1 = x;
    x = (a+b) / 2;
    fx = feval(f, x);
    val = val + 1;
end
if ~stop 
    warning("Tolleranza relativa non raggiunta, " + ... 
            "numero di iterazioni effettuate: %d", i)
end
fprintf('iterazioni: %d\n', iter);
fprintf('valutazioni: %d\n', val);
return