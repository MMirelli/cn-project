function x = solveM(A, b)
% x = solveM(A, b)
% 
% Risolve sistema lineare associato alla sottomatrice triangolare 
% inferiore di A.
% 
% Input:
%   A - matrice 
%   b - termine noto
n = size(A, 1);
x = b;
for i = 1 : n
    x(i) = x(i)/A(i, i);
    x(i+1:n) = x(i+1:n) - A(i+1:n, i) * x(i);
end