clear;

load data_2_2.mat;

for i = 1:15
    tolx = 10^-(i);
    fprintf('Tolx : %1.e\n', tolx);
    fprintf('\nNewton:\n');
    newtonSemplice(f, f1, x0, 10^-(i));
    fprintf('\nCorde:\n');
    corde(f, f1, x0, tolx);  
    fprintf('\nSecanti:\n');
    secanti(f, f1, x0, tolx);
    fprintf('-------------------------\n')
end