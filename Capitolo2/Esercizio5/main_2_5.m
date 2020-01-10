clear;

load data_2_5;

format long e;

for i = 1:10
    fprintf('Iterazioni: %d\n', i)
    x = sqrtSecanti(x0, x1, i, alpha);
    fprintf('Approssimazione:')
    disp(x)
    fprintf('Errore:')
    disp(abs(x - y))
    fprintf('--------------------------------\n')
end