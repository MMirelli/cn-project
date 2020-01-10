function L_n = lebesgueConstant(xi, x)
% L_n = lebesgueConstant(xi, x)
% 
% Valuta su dominio x la costante di Lebesgue, definita sulla 
% partizione xi.
% 
% Input:
%   xi - partizione su cui viene definita la costante
%   x - dominio di valutazione di funzione di Lebesgue e dunque 
%       del suo massimo tra xi(1) ed xi(n+1), norma infinito 
%       (/costante di Lebesgue)
% 
% Output:
%   l_n - costante di Lebesgue definita su partizione xi e valutata 
%         su dominio x
n = length(xi) - 1;
% pre-allocazione di risorse per valutazione della funzione di 
% Lebesgue
lambda_n_x = zeros(size(x));
for i = 1 : n+1
    lambda_n_x = lambda_n_x + abs(l_kn_x(i, xi, x));    
end
L_n = norm(lambda_n_x, inf);
return