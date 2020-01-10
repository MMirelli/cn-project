load rungeSamples.mat;

x = -6 : 1/1000000 : 6;

hold(axCh, 'on')
plot(axCh, x, r(x), 'MarkerFaceColor', colors(1, :))
hold(axCh, 'off')

hold(axEq, 'on')
plot(axEq, x, r(x), 'MarkerFaceColor', colors(1, :))
hold(axEq, 'off')

j = 0;

for i = [1 5:5:20]
    
    n = 2 * i; % grado del polinomio interpolante
    
    xiCh = cheby(n, -6, 6); % ascisse di Chebyshev
    xiEq = -6 : 12/n : 6;   % ascisse equidistanti
    
    p_n = @(xi, x) newton(xi, r(xi),  x); % polinomio in forma di Newton
                                          % interpolante Runge in xi
    
    iCh = abs(r(x) - p_n(xiCh, x)) <= 10^-6;  % trova intersezioni con 
                                              % polinomio interpolante 
                                              % in ascisse di Chebyshev
    
    iCh = x(iCh);
    
    
    iEq = abs(r(x) - p_n(xiCh, x)) <= 10^-6; % trova intersezioni con 
                                             % polinomio interpolante 
                                             % in ascisse equidistanti
    
    iEq = x(iEq);
        
    e_n = @(xi, x) r(x) - p_n(xi, x);
    
    j = j + 2;
    
    hold(axCh, 'on') % stampa polinomio con ascisse di Chebyshev su figura 1
    
    plot(axCh, x, p_n(xiCh, x), ...
        'MarkerFaceColor', colors(j, :))
    
    
    % disegna i punti di interpolazione di Chebyshev
    
    plot(axCh, iCh, r(iCh),'o',...
        'MarkerFaceColor',colors(j, :), ...
        'MarkerEdgeColor', colors(j, :), ...
        'MarkerSize',8-j/2)
    
    hold(axCh, 'off') 
    
    hold(axEq, 'on') % stampa polinomio con ascisse equidistanti su figura 2
    
    plot(axEq, x, p_n(xiEq, x), ... 
        'MarkerFaceColor', colors(j, :))
        
    % disegna i punti di interpolazione equidistanti
    
    plot(axEq, iEq, r(iEq),'o',...
        'MarkerFaceColor',colors(j, :), ...
        'MarkerEdgeColor', colors(j, :), ...
        'MarkerSize',8-j/2)
    
    hold(axEq, 'off')
        
    legendInfo{j} = ['$p_{' num2str(n,'%d') '}(x)$'];
    legendInfo{j + 1} = ['$p_{' num2str(n,'%d') '}(x_{i})$'];
    
end

p_l = legend(axCh, legendInfo, 'Location', 'eastoutside');
set(p_l, 'Interpreter', 'Latex');


p_l = legend(axEq, legendInfo, 'Location', 'eastoutside');
set(p_l, 'Interpreter', 'Latex');

iEq = []; iCh = []; x = []; colors = []; % disallocazione delle risorse
