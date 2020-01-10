% Calcola e stampa a video il risultato e l'errore rispetto a 
% sqrt(3) delle prime dodici iterazioni della successione 
% x_(k+1) = (3 + x_(k-1)*x_k) / (x_(k-1) + x_k), con x_0=3 e x_1=2
x0 = 3;
x1 = 2;
y = sqrt(3);
for n = 2 : 12
    fprintf('n: %d\n', n);
    x = (3 + x0*x1) / (x0 + x1);
    x0 = x1;
    x1 = x; 
    fprintf('x_n: %21.20f\n', x);
    fprintf('Errore: %1.20e\n', abs(x - y));
    fprintf('-----------------------------\n');
end