function x = sqrtNewton(x0, itmax, alpha)
% x = sqrtNewton(x0, itmax, alpha)
%
% Restituisce l'approssimazione di sqrt(alpha) effettuata con il
% metodo iterativo di Newton.
%
% Input:
%   x0 - ascissa di partenza del metodo di Newton
%   itmax - numero massimo di iterazioni
%   alpha - numero di cui si desidera trovare la radice quadrata
%
% Precondizioni:
%   alpha > 0
%
% Output:
%   Approssimazione della radice quadrata di alpha
if(alpha <= 0)
    error('sqrtNewton:NotPositiveAlpha', ...
          "Precondizione violata: alpha > 0")
end

f = @(x, a) x^2 - a;
f1 = @(x) 2*x;
for i = 0 : itmax
    fx = f(x0, alpha);
    f1x = f1(x0);
    x = x0 - fx/f1x;
    x0 = x; 
end
return
