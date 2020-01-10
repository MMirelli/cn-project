clear;
load data_3_1.mat;

fprintf('Alg per righe\n');
tic; 
triangolareInferioreUnitariaRiga(A, b)
toc;

fprintf('\nAlg per colonne\n');
tic; 
triangolareInferioreUnitariaColonna(A, b) 
toc;
