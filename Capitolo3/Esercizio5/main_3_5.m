clear;
load data_3_5.mat;

A_1_F = fattorizzazioneLDLT(A_1);

x_1 = risoluzioneSDP_LDLT(A_1_F, b_1);
fprintf('%d\n', x_1);
fprintf('\nx_1 - x_h1 = %d', abs(x_1 - x_h1));
fprintf('\nCond(A_1) = %d', cond(A_1));
fprintf('\nNorm(A_1x_1 - b_1)/Norm(b_1) = %20.21f', norm(A_1*x_1 - b_1)/norm(b_1));
fprintf('\nNorm(x_1 - x_h1)/Norm(x_h1) = %20.21f', norm(x_1 - x_h1)/norm(x_h1));

fprintf("\n\t----");

A_2_F = fattorizzazioneLDLT(A_2);

x_2 = risoluzioneSDP_LDLT(A_2_F, b_2);
fprintf('\nx_2 - x_h2 = %d', abs(x_2 - x_h2));
fprintf('\nCond(A_2) = %d', cond(A_2));
fprintf('\nNorm(A_2x_2 - b_2)/Norm(b_2) = %20.21d', norm(A_2*x_2 - b_2)/norm(b_2));
fprintf('\nNorm(x_2 - x_h2)/Norm(x_h2) = %20.21d', norm(x_2 - x_h2)/norm(x_h2));

fprintf('\n\t----');

[A_3_F, P_1] = LUPivoting(A_3);

x_3 = risoluzioneLUPivoting(A_3_F, b_3, P_1);
fprintf('\nx_3 - x_h3 = %d', abs(x_3 - x_h3));
fprintf('\nCond(A_3) = %d', cond(A_3));
fprintf('\nNorm(A_3x_3 - b_3)/Norm(b_3) = %20.21d', norm(A_3*x_3 - b_3)/norm(b_3));
fprintf('\nNorm(x_3 - x_h3)/Norm(x_h3) = %20.21d', norm(x_3 - x_h3)/norm(x_h3));

fprintf('\n\t----');

[A_4_F, P_2] = LUPivoting(A_4);

x_4 = risoluzioneLUPivoting(A_4_F, b_4, P_2);
fprintf('\nx_4 - x_h4 = %d', abs(x_4 - x_h4));
fprintf('\nCond(A_4) = %d', cond(A_4));
fprintf('\nNorm(A_4x_4 - b_4)/Norm(b_4) = %20.21d', norm(A_4*x_4 - b_4)/norm(b_4));
fprintf('\nNorm(x_4 - x_h4)/Norm(x_h4) = %20.21d', norm(x_4 - x_h4)/norm(x_h4));
fprintf('\n\t----\n');