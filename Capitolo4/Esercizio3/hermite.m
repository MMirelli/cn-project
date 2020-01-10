function y = hermite(xi, fi, f1i, x)
% y = hermite(xi, fi, f1i, x)
%
% Calcola il polinomio interpolante di Hermite nelle ascisse 
% contenute nel vettore x.
%
% Input:
%   xi - vettore contenente le ascisse d'interpolazione
%   fi - vettore contenenete i valori assunti dalla funzione nelle 
%        ascisse d'interpolazione
%   f1i - vettore contenente i valori assunti dalla derivata prima 
%         della funzione nelle ascisse d'interpolazione
%   x - vettore delle ascisse in cui calcolare il polinomio di 
%       Hermite
%
% Precondizioni:
%   length(xi) == length(fi) == length(f1i)
%   xi(i) ~= xi(j) per ogni i ~= j con i, j = 1, ..., n+1
% 
% Output:
%   y - valore assunto dal polinomio di Hermite
errMsg = "Precondizione violata: ";
if length(xi) ~= length(fi)
    error(errMsg + "length(xi) == length(fi)")
elseif length(xi) ~= length(f1i)
    error(errMsg + "length(xi) == length(f1i)")
elseif length(xi) ~= length(unique(xi))
    error(errMsg + "xi(i) ~= xi(j) per ogni i ~= j")
end

n = length(xi) - 1;
a = ones(1, (n+1)*2);

% costruisci un vettore contenente le ascisse d'interpolazione 
% duplicate, cioe' della forma [x_0 x_0 x_1 x_1 ... x_n x_n]
xd = repelem(xi, 2);

% costruisci un vettore a della forma
% [f(x_0) f'(x_0) f(x_1) f'(x-1) ... f(x_n) f'(x_n)]
for i = 1 : n+1
    a(i*2-1) = fi(i);
end
for i = 1 : n+1
    a(i*2) = f1i(i);
end

% calcola le differenze divise
for i = 2*n+1 : -2 : 3
    a(i) = (a(i) - a(i-2))/(xd(i) - xd(i-2));
end
for j = 2 : 2*n + 1
    for i = 2*n + 2 : -1 : j+1
        a(i) = (a(i) - a(i-1))/(xd(i) - xd(i-j));
    end 
end

y = calcolaPolinomio(a, x, xd);
return;