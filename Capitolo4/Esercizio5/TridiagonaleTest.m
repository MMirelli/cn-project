classdef TridiagonaleTest < matlab.unittest.TestCase
    
    methods (Test)
        function wrongMatrixDimensionF(tC)
            actual = @()tridiagonale([1 1], 1, 1, 1);
            expected = 'tridiagonale:WrongMatrixDimension';
            tC.assertError(actual, expected);  
        end
        
        function wrongMatrixDimensionB(tC)
            actual = @()tridiagonale([1 1], [1 1], 1, [1 1]);
            expected = 'tridiagonale:WrongMatrixDimension';
            tC.assertError(actual, expected);  
        end
        
        function wrongMatrixDimensionC(tC)
            actual = @()tridiagonale([1 1], 1, [1 1], [1 1]);
            expected = 'tridiagonale:WrongMatrixDimension';
            tC.assertError(actual, expected);  
        end
        
        function diagonalWithZeros(tC)
            actual = @()tridiagonale([1 0], 1, 1, [1 1]);
            expected = 'tridiagonale:ZeroDiagonal';
            tC.assertError(actual, expected);  
        end
        
        function solveSystem(tC)
            a = 1 : 5;
            b = [-1 1 2 0];
            c = [0 0 2 2];
            f = [1 -1 3 2 -2]';
            actual = tridiagonale(a, b, c, f);
            expected = linsolve(diag(a)+diag(b,-1)+diag(c,1), f);
            tC.verifyEqual(actual, expected, 'RelTol', 1e-10)
        end
    end
end

