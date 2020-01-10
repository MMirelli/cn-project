function esercizio3()
% esercizio3
% 
% Calcola e stampa a video l'approssimazione della derivata di 
% f(x) = x^4, mediante la formula phi_h(x) = (f(x+h) - f(x-h))/2h, 
% con h = 10^-j, j appartenente a [1, 10] ed x = 1.
f = @(x) x^4;
phi = @(func, h, x) (func(x+h)-func(x-h)) / (2*h);
for j = 1:10
    fprintf('h: %d\n', 10^(-j))
    DfxTilda = phi(f, 10^(-j), 1);
    Dfx = 4;
    fprintf('phi_h(x): %21.20f\n', DfxTilda)
    fprintf('|O(h^2)|: %21.20f\n', abs(Dfx-DfxTilda))
    fprintf('--------------------------\n')
end