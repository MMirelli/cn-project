clear;

load data_2_1.mat;

for i = 10:14
    x = bisezione(f, a, b, 10^(-i));
    fprintf('x: %20.15f\n', x)
    fprintf('--------------------------\n');
end