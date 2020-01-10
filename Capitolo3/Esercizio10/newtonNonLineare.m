function x = newtonNonLineare(F,J,x0,iter_max,tolx)
% x = newtonNonLineare(F,J,x0,iter_max,tolx)
% 
% Calcola la soluzione di un sistema non lineare usando il metodo 
% di Newton.
% 
% Input:
%   F - vettore che ha per elementi le funzioni di cui si intende 
%       calcolare gli zeri 
%   J - Jacobiano di F
%   x0 - punto di innesco
%   iter_max - numero massimo di iterazioni
%   tolx - massimo errore assoluto 
%
% Output:
%   x - soluzione del sistema non lineare

iterazioni = 0;
xold = x0;
x = x0;
itera = 1;
while itera
    Jx = feval(J, x0);
    Fx = feval(F,x0);
    [PA, p] = LUPivoting(Jx);
    x = x + risoluzioneLUPivoting(PA, -Fx, p);
    iterazioni = iterazioni + 1;
    itera = (iterazioni<iter_max) && (norm(x-x0) > tolx);
    xold = x0;
    x0 = x;
end
fprintf('Numero di iterazioni: %d\n', iterazioni);
format short e;
fprintf('Norma ultimo incremento:')
disp(norm(x-xold));
end