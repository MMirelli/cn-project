% Calcola e stampa a video il risultato e l'errore rispetto a 
% sqrt(3) delle prime dieci iterazioni della successione 
% x_(k+1) = (x_k + 3/x_k)/2, con x_0=3
x = 3;
y = sqrt(3);
for n = 1 : 10
    fprintf("n: %d\n", n);
    x = (x + 3/x)/2;
    fprintf('x_n: %21.20f\n', x);
    fprintf('Errore: %1.20e\n', abs(x - y));
    fprintf('-----------------------------\n');
end