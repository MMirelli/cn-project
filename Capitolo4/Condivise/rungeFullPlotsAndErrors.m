function errors = rungeFullPlotsAndErrors()
% norms = rungeFullPlots()
% 
% Computa e disegna su quattro figure distinte, usando le due 
% function "lagrange" e "newton", i polinomi interpolanti la 
% funzione di Runge in x_i = 2*i per ogni i = 1, 2, ..., 20, 
% nell'intervallo [-6, 6]. Ritorna una matrice contenente gli 
% errori dei polinomi come specificato di seguito. 
% Nelle prime due figure vengono stampate le approssimazioni 
% polinomiali di Runge in forma di Lagrange e Newton (esercizio 7), 
% con scelta delle ascisse di Chebyshev; nella terza e quarta le 
% approssimazioni polinomiali nella forma di Lagrange e Newton, ma 
% su partizione uniforme (esercizio 9).
% 
% Input:
%    - 
% 
% Output:
%   errors(20, 2) - matrice di double t.c. 
%       errors(i, 1) - contiene l'errore del polinomio di grado 2*i 
%                      interpolante Runge nelle (2*i)+1 ascisse di 
%                      Chebyshev 
%       errors(i, 2) - contiene l'errore del polinomio di grado 2*i 
%                      interpolante Runge in (2*i)+1 ascisse 
%                      equidistanti.

% caricamento dei dati: errors(20, 2), legendInfo (1, 11), ...
load rungeFullPlots.mat;

x = -6 : 1/10000 : 6;

% tracciano Runge su entrambi le figure
hold(axLCh, 'on')
plot(axLCh, x, r(x), 'MarkerFaceColor', colors(1, :))
hold(axLCh, 'off')

hold(axNCh, 'on')
plot(axNCh, x, r(x), 'MarkerFaceColor', colors(1, :))
ylim(axNCh, [-0.4 1])
hold(axNCh, 'off')

hold(axLEq, 'on')
plot(axLEq, x, r(x), 'MarkerFaceColor', colors(1, :))
hold(axLEq, 'off')

hold(axNEq, 'on')
plot(axNEq, x, r(x), 'MarkerFaceColor', colors(1, :))
hold(axNEq, 'off')

for i = 1 : 20     
    n = 2 * i; % grado del polinomio interpolante
    
    xiCh = cheby(n, -6, 6); % ascisse di Chebyshev
    xiEq = -6 : 12/n : 6;   % ascisse equidistanti
    
    p_l = @(xi, x) lagrange(xi, r(xi),  x); % polinomio di Lagrange
    % interpolante Runge in ascisse generiche 
    p_n = @(xi, x) newton(xi, r(xi),  x); % polinomio di Newton
    % interpolante Runge in ascisse generiche
    
    e_n = @(xi, x) r(x) - p_n(xi, x);
    % errore del polinomio in forma di Newton interpolante Runge 
    % nelle ascisse di Chebyshev
    errors(i, 1) = norm(e_n(xiCh, x), inf);
    % errore del polinomio in forma di Newton interpolante Runge in 
    % ascisse equidistanti
    errors(i, 2) = norm(e_n(xiEq, x), inf); 
    
    hold(axLCh, 'on') % stampa polinomio di Lagrange Ch su figura 1
    plot(axLCh, x, p_l(xiCh, x), ...
        'MarkerFaceColor', colors(i+1, :))
    hold(axLCh, 'off')
    
    hold(axNCh, 'on') % stampa polinomio di Newton Ch su figura 2
    plot(axNCh, x, p_n(xiCh, x), ...
        'MarkerFaceColor', colors(i+1, :))
    hold(axNCh, 'off')
    
    % stampa polinomio di Lagrange Equi su figura 3
    hold(axLEq, 'on') 
    plot(axLEq, x, p_l(xiEq, x), ...
        'MarkerFaceColor', colors(i+1, :))
    hold(axLEq, 'off')
    
    hold(axNEq, 'on') % stampa polinomio di Newton Equi su figura 4
    plot(axNEq, x, p_n(xiEq, x), ...
        'MarkerFaceColor', colors(i+1, :))
    hold(axNEq, 'off')
    
    legendInfo{i + 1} = ['$p_{' num2str(n,'%d') '}(x)$'];
    
end

leg = legend(axLCh, legendInfo, 'Location', 'eastoutside');
set(leg, 'Interpreter', 'Latex');

leg = legend(axNCh, legendInfo, 'Location', 'eastoutside');
set(leg, 'Interpreter', 'Latex');

leg = legend(axLEq, legendInfo, 'Location', 'eastoutside');
set(leg, 'Interpreter', 'Latex');

leg = legend(axNEq, legendInfo, 'Location', 'eastoutside');
set(leg, 'Interpreter', 'Latex');

x = []; xiCh = []; xiEq = []; 

return