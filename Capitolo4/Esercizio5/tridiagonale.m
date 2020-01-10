function f = tridiagonale(a, b, c, f)
% f = tridiagonale(a, b, c, f)
%
% Calcola il sistema lineare Ax=f dove A e' una matrice 
% tridiagonale avente il vettore a come diagonale principale, il 
% vettore b come sottodiagonale e il vettore c come sopradiagonale.
%
% Es: Se A e' una matrice 5x5 sara' della forma
%     | a c 0 0 0 |
%     | b a c 0 0 |
% A = | 0 b a c 0 |
%     | 0 0 b a c |
%     | 0 0 0 b a |
%
% Input:
%   a - vettore contenente la diagonale principale
%   b - vettore contenente i valori sotto la diagonale principale
%   c - vettore contenente i valori sopra la diagonale principale
%   f - vettore dei termini noti
%
% Precondizioni:
%   length(a) == length(f) == length(b)+1 == length(c)+1
%   a(i) ~= 0 per ogni i = 1, ... , n
%
% Output:
%   x - vettore soluzione del sistema lineare
errMsg = "Precondizione violata: ";
if length(a) ~= length(f)
    error('tridiagonale:WrongMatrixDimension', ...
          errMsg + "length(a) == length(f)");
elseif length(a) ~= length(b)+1
    error('tridiagonale:WrongMatrixDimension', ...
          errMsg + "length(a) == length(b)+1");
elseif length(a) ~= length(c)+1
    error('tridiagonale:WrongMatrixDimension', ...
          errMsg + "length(a) == length(c)+1");
elseif ~all(a)
    error('tridiagonale:ZeroDiagonal', ...
          errMsg + "a(i) ~= 0 per ogni i = 1, ... , n");
end

n = length(a);

% fattorizzazione LU
for i = 1 : n-1
    b(i) = b(i) / a(i);
    a(i+1) = a(i+1) - b(i)*c(i);
end

% fattore L
for i = 1 : n-1
    f(i+1) = f(i+1) - b(i)*f(i);
end

% fattore U
f(n) = f(n) / a(n);
for i = 1 : n-1
    f(n-i) = (f(n-i) - c(n-i)*f(n-i+1))/a(n-i);
end
return


