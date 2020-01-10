function A = fattorizzazioneLU(A)
% A = fattorizzazioneLU(A)
%
% Applica la fattorizzazione LU alla matrice A.
%
% Input:
%   A - matrice da fattorizzare
%
% Precondizioni:
%   A matrice non singolare
%
% Output:
%   A - matrice A fattorizzata LU, la matrice L viene memorizzata
%       nella parte inferiore mentre la matrice U viene memorizzata
%       nella parte superiore.
n = size(A, 1);
for i=1:n-1    
    if A(i,i)==0
        error('fattorizzazioneLU:SingolarMatrix', ...
              'Precondizione violata: La matrice e'' singolare')
    end
    A(i+1:n, i) = A(i+1:n, i) / A(i,i);
    A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i)*A(i, i+1:n);
end
end