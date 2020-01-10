% eseguo loading di xi e fi
load data_4_4.mat;

% costruisco l'intervallo su cui calcolerò le approssimazioni
x = 0 : pi/100 : 2*pi+1;
% genero i punti da approssimare
f = sin(x);

p_l = lagrange(xi, fi, x);
p_n = newton(xi, fi, x);
p_h = hermite( xi, fi, cos(xi), x );

refresh
%  plot( x, f, x, p_l, x, p_n, x, p_h )
plot( x, f, x, p_l, x, p_h )

% trova intersezioni con polinomio in forma di Lagrange
il = find(abs(f - p_l) <= 10^-15);
% trova intersezioni con polinomio in forma di Newton
in = find(abs(f - p_n) <= 10^-15);
% trova intersezioni con polinomio in forma di Hermite
ih = find(abs(f - p_h) <= 10^-15);

                                 
% Disegna i punti di interpolazione, che giustamente coincidono, 
% per tutti i polinomi tracciati.
hold on
plot([x(il), x(in), x(ih)], [f(il), f(in),  f(ih)], '.',...
        'MarkerEdgeColor', 'r', ...
    'MarkerSize',15)
hold off

legend('sin(x)', 'p_{l}(x) \equiv p_{n}(x)', 'p_{h}(x)', ...,
    'punti interpolanti', 'Location', 'northoutside' )

p_n =[]; p_l =[]; p_h =[]; x =[];