clear;

load data_3_9.mat;

fprintf('Nel senso dei minimi quadrati\n')
minimiQuadrati(A1, b1)
fprintf('Risoluzione Matlab')
A1\b1
fprintf('-------------------------\n')
fprintf('Nel senso dei minimi quadrati\n')
minimiQuadrati(A2, b2)
fprintf('Risoluzione Matlab')
A2\b2
