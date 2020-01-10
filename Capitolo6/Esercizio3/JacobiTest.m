classdef JacobiTest < matlab.unittest.TestCase
    
    properties
        A, b, tol, x, maxit, n
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.n = 11;
            tC.A = sparseA(tC.n);
            tC.b = ones(tC.n, 1);
            tC.tol = 1e-5;
            tC.maxit = 10000;
        end
        
    end
    
    methods (Test)
        function wrongInitialApprDimensions(tC)
            expected = 'jacobi:wrongInitialApprDimensions';
            
            wrongApprVector = zeros(tC.n-1, 1);
            
            actual = @()jacobi(tC.A, tC.b, tC.tol, ...
                               wrongApprVector);
            tC.assertError(actual,expected);
        end
        
        function notSquaredInputMatrix(tC)
            expected = 'jacobi:notSquaredInputMatrix';
            
            notSquaredMatrix = spalloc(tC.n, tC.n+1, 1);
                        
            actual = @()jacobi(notSquaredMatrix, tC.b, tC.tol);
            tC.assertError(actual,expected);
        end
        
        
        function solve(tC)
            expected = tC.A\tC.b;
            
            actual = jacobi(tC.A, tC.b, tC.tol);
            tC.verifyEqual(actual, expected, 'RelTol', tC.tol);
        end
        
    end
    
end