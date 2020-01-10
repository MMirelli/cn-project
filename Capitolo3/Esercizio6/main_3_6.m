clear;
load data_3_6.mat;

fattorizzazioneLU(A);

s_1 = U\(L\b);
fprintf('U \\ (L \\ b) = %13.12f\n', U\(L\b)); 

s_2 = A\b;
fprintf('A \\ b = %13.12f\n', A\b); 

norm(s_1-e)/norm(e)
norm(s_2-e)/norm(e)
