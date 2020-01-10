classdef PotenzeTest < matlab.unittest.TestCase
    
    properties
        A, tol, x0
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.A = [2 -1; -1 2];
            tC.tol = 1e-5;
            tC.x0 = [1 0]';
        end
    end
    
    methods (Test)
        function notSquare(tC)
            notSquare = [1 2 3; 4 5 6];
            tC.assertError(@() potenze(notSquare, tC.tol), ...
                           "potenze:NotSquareMatrix");
        end
        
        function wrongSize(tC)
            wrongSizeX0 = ones(4, 1);
            tC.assertError(@() potenze(tC.A, tC.tol, wrongSizeX0), ...
                           "potenze:WrongSize");
        end
        
        function reachMaxit(tC)
            expected = 14/5;
            actual = potenze(tC.A, tC.tol, tC.x0, 2);
            tC.verifyEqual(actual, expected);
        end
        
        function reachTol(tC)
            expected = 3;
            actual = potenze(tC.A, tC.tol, tC.x0, 100);
            tC.verifyEqual(actual, expected, 'RelTol', tC.tol);
        end
    end
    
end

