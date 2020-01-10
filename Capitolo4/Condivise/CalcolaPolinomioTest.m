classdef CalcolaPolinomioTest < matlab.unittest.TestCase
    
    properties
        p, x
    end
     
     methods (TestMethodSetup)
        function setup(tC)
            tC.p = [0, 1, 0, 0, 0, 0];
            tC.x = [7, 8, 9];
        end
    end
    
     methods (Test)
        
        function testByPolival(tC)
           tC.p = [3 2 1];
           tC.x = [5 7 9];
           actual = calcolaPolinomio(fliplr(tC.p), tC.x);
           expected = polyval(tC.p, tC.x);
           tC.verifyEqual(actual, expected);
        end
       
        function testByExercise(tC)
            % Compito 08.06.16 (Newton)
            xi = 0:5;
            actual = calcolaPolinomio(tC.p, tC.x, xi);
            expected = [7, 8, 9];
            tC.verifyEqual(actual, expected);
        end
        
        function interpNodesCoefficientsMismatch(tC)
            wrongSizeXi = 0:3; % wrong size
            actual = @()calcolaPolinomio(tC.p, tC.x, wrongSizeXi);
            expected = "calcolaPolinomio:" + ...
                       "InterpolationNodesNumberMismatch";
            tC.assertError(actual, expected);  
        end
    end
end




