clear;

load data_2_3.mat;

for i = 1:15
    tolx = 10^-(i);
    fprintf('Tolx : %d\n', tolx);
    fprintf('\nNewton semplice:\n');
    newtonSemplice(f, f1, x0, 10^-(i));
    fprintf('\nNewton modificato:\n');
    newtonModificato(f, f1, m, x0, tolx);  
    fprintf('\nAitken:\n');
    aitken(f, f1, x0, tolx);
    fprintf('-------------------------\n')
end