function S = sparseA(n)
% S = sparseA(n)
% 
% Genera una matrice sparsa (n x n) con la seguente struttura:
% 
%                   |a11 ... a1n|            4 se i=j
%              S =  |.        . |           /
%                   |.        . | t.c. aij =- -1 se i=j+-1          
%                   |an1 ... ann|           \
%                                            -1 se i=j+-10
% Input:
%   n - dimensione della matrice quadrata
% 
% Precondizioni:
%   n > 10
% 
% Output:
%   S - matrice, con struttura come sopra
errMsg = "Precondizione violata: ";
if n <= 10
    error('sparseA:SmallMatrixDimensions', errMsg + "n > 10")
end
nonZerosBound = 6 + 4 * (n-2); % gli elementi diversi da zero non 
                               % possono essere in numero maggiore 
                               % di nonZerosBound
S = spalloc(n, n, nonZerosBound);
S = spdiags([-1 -1 4 -1 -1] .* ones(n, 5), [-10 -1 0 1 10], S);
return
