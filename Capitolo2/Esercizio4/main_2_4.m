% Calcola l'approssimazione della radice quadrata di 5 con il 
% metodo di Newton e stampa il numero di iterazioni e l'errore.
clear;

load data_2_4.mat;

format long e;

for i = 1:10
    fprintf('Iterazioni: %d\n', i)
    x = sqrtNewton(x0, i, alpha);
    fprintf('Approssimazione:')
    disp(x)
    fprintf('Errore:')
    disp(abs(x - y))
    fprintf('--------------------------------\n')
end