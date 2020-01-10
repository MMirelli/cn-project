    function [x, i, norms] = jacobi(A, b, tol, x, itmax)
% [x, i, norms] = jacobi(A, b, tol[, x, maxit])
% 
% Calcola la soluzione del sistema lineare Ax=b, mediante il metodo
% iterativo di Jacobi.
% 
% Input:
%   A - matrice quadrata sparsa 
%   b - termine noto del sistema lineare Ax=b
%   tol - approssimazione dell'errore relativo 
%   [x] - approssimazione iniziale della soluzione, di default 
%         vettore nullo
%   [maxit] - numero di iterazioni massime, impiegabili per
%           portare a termine il calcolo
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
D = diag(A);
if nargin < 5
    % per quanto enunciato a lezione, e visto nel caso di page 
    % rank, tale stima consente di calcolare il numero di 
    % iterazioni sufficiente a raggiungere l'ordine di
    % approssimazione desiderato.
    itmax = 1000 * n * max(round(log(tol)), 1);
end
if nargin < 4
    x = zeros(n, 1);
end

errMsg = "Precondizione violata: ";
if size(x, 1) ~= n
   error('jacobi:wrongInitialApprDimensions', ...
         errMsg + "size(A, 1) = size(x, 1)");
elseif size(A, 2) ~= n
   error('jacobi:notSquaredInputMatrix', ...
         errMsg + "size(A, 1) = size(A, 2)");
end

tol = tol * norm(b, Inf); % si limita in tal modo una stima 
% dell'errore relativo. Altrimenti e_k <= norm(inv(A))*norm(r_k), 
% che varia in base a norm(inv(A)). 
% Difatti e' facile da dimostrare come questo limite superiore ci
% assicuri una limitazione costante dell'errore 
% e <= (tol/cond(A)) * x*, con x* soluzione del sistema
norms = zeros(itmax,1);
for i = 1 : itmax
    r = A * x - b;
    norms(i) = norm(r, inf);
    if norms(i) <= tol, break, end
    r = -r./D;
    x = x+r;
end 
if norms(i) > tol
    warning("Numero di iterazioni massime raggiunto, " + ...
            "tol non raggiunta");
end
norms = norms(1:i);
return