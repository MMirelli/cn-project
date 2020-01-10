function plot6_34(tol, method)
% plot6_34(tol, method)
% 
% Effettua plotting del numero delle iterazioni necessarie, in 
% funzione di n, dimensione della matrice A = sparseA(n), per il
% calcolo della soluzione Ax = ones(n,1), mediante il metodo di 
% Jacobi o Gauss-Seidel, con tolleranza pari a tol e 
% approssimazione iniziale x0 = zeros(n,1).
% 
% Input:
%   tol - approssimazione dell'errore relativo
%   method - stringa identificativa del metodo da usare 
% 
% Precondizioni:
%   method - valori: 
%               'j' - Jacobi
%               'gs' - Gauss-Seidel
% Output:
%    - 
x = 100 : 20 : 1000;
i = zeros(size(x)); curr = 1;
for n = x
    A = sparseA(n);
    switch method
        case 'j'
            [~, i(curr), ~] = jacobi(A, ones(n,1), tol); 
        case 'gs'
            [~, i(curr), ~] = gs(A, ones(n,1), tol); 
        otherwise
            error('plot6_3:notAValidMethod', ...
                  "Precondizione violata: \n" + ...
                  "\tmethod - valori: \n" + ...
                  "\t\t\'j\' - Jacobi \n" + ...
                  "\t\t\'gs\' - Gauss-Seidel");
    end
    curr = curr + 1;
end

if method == 'j'
    figure('Name', 'Jacobi: iter(n)');
else
    figure('Name', 'Gauss-Seidel: iter(n)');
end

plot(x, i);