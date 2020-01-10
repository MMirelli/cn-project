function [x, i, norms] = gs(A, b, tol, x, itmax)
% [x, i, norms] = gs(A, b, tol[, x, itmax])
% 
% Calcola la soluzione del sistema lineare Ax = b, usando il metodo
% di iterazione di Gauss-Seidel.
% 
% Input:
%   A - matrice quadrata sparsa associata al sistema
%   b - termine noto
%   tol - tolleranza che indica ordine di approssimazione della 
%         soluzione
%   [x] - approssimazione iniziale della soluzione del problema,
%          di default vettore nullo
%   [itmax] - numero di iterazioni massime
% 
% Precondizioni:
%   size(A, 1) = size(A, 2) [= size(x, 1)] 
% 
% Output:
%   x - soluzione del sistema lineare associato a Ax = b
%   i - numero di iterazioni necessarie per calcolare la soluzione
%   norms - vettore contenente la norma del residuo a ciascuna 
%           iterazione

n = size(A, 1);
errMsg = "Precondizione violata: ";
if nargin < 5
    itmax = 100 * n * max(round(log(tol)), 1);
end
if nargin < 4
    x = zeros(n, 1);
end
if size(x, 1) ~= n
   error('gs:wrongInitialApprDimensions', ...
         errMsg + "size(A, 1) = " + "size(A, 2) [= size(x, 1)]");
end
if size(A, 2) ~= n
   error('gs:notSquaredInputMatrix', ...
         errMsg + "size(A, 1) = " + "size(A, 2) [= size(x, 1)]");
end
norms = zeros(itmax,1);
for i = 1 : itmax
   r = A * x - b;
   norms(i) = norm(r, inf);
   if norms(i) <= tol * norm(b, inf), break, end
   r = solveM(A, r); % si sovrascrive opportunamente il vettore 
   % u_k = x_k+1 - x_k con r_k (r), 
   % nella relazione M*u_k = -r_k <> u_k = -inv(M)*r_k <>
   x = x - r;  % <> x_k+1 = x_k - -inv(M)*r_k
end
if norms(i) > tol 
    warning("Numero di iterazioni massime raggiunto, "+ ...
            "tol non raggiunta"); 
end
norms = norms(1:i);
return
