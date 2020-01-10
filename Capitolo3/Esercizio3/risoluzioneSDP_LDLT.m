function x = risoluzioneSDP_LDLT(A, b)
% x = risoluzioneSDP_LDLT(A, b)
%
% Risolve il sistema lineare Ax=b con A matrice sdp fattorizzata 
% LDL^t.
%
% Input:
%   A - matrice dei coefficienti
%   b - vettore dei termini noti
%
% Precondizioni:
%   A matrice fattorizzata LDLT^t
%
% Output:
%   x - vettore soluzione del sistema lineare associato
z = triangolareInferioreUnitariaColonna(A, b);
y = diagonale(diag(A), z);
x = triangolareSuperioreUnitariaColonna(A', y);
end