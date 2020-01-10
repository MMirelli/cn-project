function esercizio5(delta)
% esercizio5(delta)
% 
% Calcola e stampa le approssimazioni delle somme di delta.
% 
% Input:
%   delta - double 
% 
% Precondizioni:
%   delta < 1
    x = 0;
    count = 0;
    while x ~= 1
        x = x +delta
        count = count + 1
    end
end