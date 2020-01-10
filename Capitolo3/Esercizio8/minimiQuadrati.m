function x = minimiQuadrati(A, b)
% x = minimiQuadrati(A, b)
%
% Risolve il sistema lineare sovradeterminato Ax=b nel senso dei 
% minimi quadrati.
%
% Input:
%   A - matrice dei coefficienti
%   b - vettore dei termini noti
%
% Precondizioni:
%   La matrice A ha rank massimo
%
% Output:
%   x - soluzione nel senso dei minimi quadrati
[m, n] = size(A);
A = fattorizzazioneQR(A);
QT = eye(m);
for i = 1:n
    v = [zeros(i-1,1); 1; A(i+1:end,i)];
    H = eye(m) - (2 /(v'*v)) * (v*v'); 
    QT = H*QT;
end
g = QT * b;
x = triangolareSuperioreColonna(A(1:n,:), g(1:n));
return