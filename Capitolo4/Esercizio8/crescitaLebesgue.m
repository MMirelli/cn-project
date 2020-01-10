x = -6 : 1/1000 : 6;
L = zeros(20, 2);
for i = 1 : 20
    n = 2 * i; % grado del polinomio interpolante
    
    xiCh = cheby(n, -6, 6); % ascisse di Chebyshev
    xiEq = -6 : 12/n : 6;   % ascisse equidistanti
    
    L(i, 1) = lebesgueConstant(xiCh, x);
    L(i, 2) = lebesgueConstant(xiEq, x);
end
