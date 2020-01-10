function x = sqrtSecanti(x0, x1, it_max, alpha)
% x = sqrtSecanti(x0, itmax, alpha)
%
% Restituisce l'approssimazione di sqrt(alpha) effettuata con il
% metodo iterativo delle secanti.
%
% Input:
%   x0 - prima ascissa della procedura iterativa delle secanti
%   x1 - seconda ascissa della procedura iterativa delle secanti
%   itmax - numero massimo di iterazioni
%   alpha - numero di cui si desidera trovare la radice quadrata
%
% Precondizioni:
%   alpha > 0
%
% Output:
%   Approssimazione della radice quadrata di alpha
if(alpha <= 0)
    error("sqrtSecanti:NotPositiveAlpha", ...
          "Precondizione violata: alpha > 0")
end
f = @(x, a) x^2 - a;   
for i = 0:it_max
    fx0 = feval(f, x0, alpha);
    fx1 = feval(f, x1, alpha);
    if (fx1-fx0) == 0
        warning("Divisione per zero, " + ...
                "migliore approssimazione ottenibile tramite " + ...
                "questo metodo: %13.12f.\n", x1);
        return
    end
    x = (fx1*x0-fx0*x1)/(fx1-fx0);
    x0 = x1;
    x1 = x;
end  
return