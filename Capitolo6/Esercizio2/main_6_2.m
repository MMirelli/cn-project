% Esegue il metodo delle potenze con la matrice A_n per 
% n = 100, 200, ... 1000
for n = 100 : 100 : 1000
    A = sparseA(n);
    potenze(A, 1e-5, ones(n, 1))
end