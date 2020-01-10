function [A, p] = LUPivoting(A)
% [A, p] = LUPivoting(A)
%
% Applica la fattorizzazione LU pivoting alla matrice A.
%
% Input:
%   A - matrice da fattorizzare
%
% Precondizioni:
%   A matrice non singolare
%
% Output:
%   A - matrice A fattorizzata con LU Pivoting
%   p - vettore delle permutazioni della fattorizzazione LU 
%       Pivoting
n = size(A);
p = 1:n;
for i = 1:n-1
    [mi, ki] = max( abs(A(i:n,i) ));
    if mi == 0
        error('LUPivoting:SingolarMatrix', ...
              'Precondizione violata: La matrice e'' singolare')
    end
    ki = ki + i - 1;
    if ki > i
        A([i ki],:) = A([ki i],:);
        p([i ki]) = p([ki i]);
    end
    A(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n, i+1:n) = A(i+1:n,i+1:n) - A(i+1:n,i)*A(i,i+1:n);
end
return