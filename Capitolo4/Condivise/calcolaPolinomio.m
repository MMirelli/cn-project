function p = calcolaPolinomio(a, x, xi)
% p = calcolaPolinomio(a, x[, xi]) 
%    
% Calcola il polinomio di coefficienti a nelle ascisse x.
%    
% Input:
%   a - vettore dei coefficienti, in ordine crescente, t.c. il 
%       polinomio
%       p(x) = a(1) + a(2)*x + ... + a(n+1)*x^n
%   x - vettore delle ascisse nelle quali valutare il polinomio
%   [xi] - vettore delle ascisse d'interpolazione qualora si 
%          tratti di un polinomio in forma di Newton 
%        
% Precondizioni:
%   length(a) == length(xi) - qualora si calcoli un polinomio in 
%                             forma di Newton
% 
% Output
%   p - valutazione del polinomio nei punti x
if nargin < 3 % se non esiste non viene valutato un polinomio in 
              % forma di Newton, dunque si esegue Horner semplice          
    xi = zeros(size(a));

elseif length(a) ~= length(xi)
    error('calcolaPolinomio:InterpolationNodesNumberMismatch',...
          "Precondizione violata: length(a) == length(xi)");
end

n = length(xi) - 1;
p = a(n+1) * ones(size(x));

for i = n : -1 : 1
   p = p .* (x - xi(i)) + a(i);
end

return