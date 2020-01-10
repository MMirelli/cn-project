function A = fattorizzazioneLDLT(A)
% A = fattorizzazioneLDLT(A)
%
% Fattorizza la matrice A nella forma LDL^t.
%
% Input:
%   A - matrice da fattorizzare
%
% Precondizioni:
%   A deve essere sdp
%
% Output:
%   A - matrice fattorizzata contenente L nella sotto matrice
%       inferiore e D nella diagonale.
n = size(A, 1);
if A(1, 1) <= 0 
    error('fattorizzazioneLDLT:NotSDP', ...
          'Precondizione violata: la matrice A non e'' sdp') 
end
A(2:n,1) = A(2:n,1) / A(1,1);
for j = 2:n
    v = (A(j,1:j-1).') .* diag(A(1:j-1,1:j-1));
    A(j,j) = A(j,j) - A(j,1:j-1)*v;
    if A(j,j) <=0
        error('fattorizzazioneLDLT:NotSDP', ...
              'Precondizione violata: la matrice A non e'' sdp')
    end
    A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n, 1:j-1)*v)/A(j,j);
end
return