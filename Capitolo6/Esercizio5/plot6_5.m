function plot6_5(tol)
% plot6_5(tol)
% 
% Effettua plotting della norma del residuo, in funzione del numero
% di iterazioni eseguite dal metodo di Jacobi e Gauss-Seidel per la
% risoluzione del sistema Ax=b, con A = sparseA(n), b = ones(n,1), 
% n = 1000. 
%
% Input:
%   tol - approssimazione dell'errore relativo
% 
% Precondizioni:
%   method - valori: 
%               'j' - Jacobi
%               'gs' - Gauss-Seidel
% Output:
%    - 
n = 1000;
A = sparseA(n);
[~, ~, normsJ] = jacobi(A, ones(1000,1), tol); 
normsJ = nonzeros(normsJ);
xJ = 1:size(normsJ,1);

A = sparseA(n);
[~, ~, normsGS] = gs(A, ones(1000,1), tol); 
normsGS = nonzeros(normsGS);
xGS = 1:size(normsGS,1);

plot(xJ, normsJ, xGS, normsGS);
leg = legend('$||r(i)_J||_2$', '$||r(i)_{GS}||_2$');
set(leg, 'Interpreter', 'Latex');