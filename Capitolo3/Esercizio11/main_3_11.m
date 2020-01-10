clear;

load data_3_11.mat;

format short e;

for t = 3:3:6
    tolx = 10^-t;
    fprintf('tolx = %e\n\n', tolx)
    for i = 1:10
        x = newtonNonLineare(F,J,x0,i,tolx);
        fprintf('Norma errore: ')
        disp(norm(x - [1/12 1/6]'))  
        fprintf('--------------------------\n')
    end
    fprintf('-----------------------\n')
end