function lambda = potenze(A, tol, x0, maxit)
% lambda = potenze(A, tol[, x0, maxit])
%
% Appossima con tolleranza tol l'autovalore di modulo massimo della 
% matrice A con il metodo delle potenze.
%
% Input:
%   A - matrice dove calcolare l'autovalore
%   tol - tolleranza dell'approssimazione dell'autovalore
%   [x0] - vettore iniziale, di default viene utilizzato un vettore
%          casuale
%   [maxit] -  numero massimo di iterazioni, di default vengono
%              eseguite 100*n*max(round(-log(tol))) iterazioni
%
% Precondizioni:
%   A - matrice quadrata
%   length(x0) == length(A)
%
% Output:
%   lambda - approssimazione dell'autovalore di modulo massimo
%            della matrice A
errMsg = "Precondizione violata: ";
if size(A, 1) ~= size(A, 2)
    error("potenze:NotSquareMatrix", ...
          errMsg + "la matrice A deve essere quadrata")
end
n = length(A);
if nargin <= 2  % x0 non e' stato specificato
    x0 = rand(n, 1);
elseif length(x0) ~= n
        error("potenze:WrongSize", ...
              errMsg + "length(x0) == length(A)")
end
if nargin <= 3  % maxit non sono state specificate
    maxit = 100*n*max(round(-log(tol)));
end
x0 = x0 ./ norm(x0);
lambda0 = inf;
for i = 1 : maxit
    z = A * x0;
    lambda = x0' * z;
    if abs(lambda - lambda0) < tol
        fprintf("Raggiunta la tolleranza in %d iterazioni", i);
        return
    end
    lambda0 = lambda;
    x0 = z ./ norm(z);
end
warning("Raggiunto il limite massimo di iterazioni: %d", maxit);
return

