classdef DifferenzeDiviseTest < matlab.unittest.TestCase
    
    properties
        xi, fi
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.xi = [-1, 0, 1, 2, 3];
            tC.fi = [1, 0, 1, 4, 9];
        end
    end
    
    methods (Test)
        
        function testByExerciseOne(tC)
            % Compito 08.06.16 (Newton)
            tC.xi = 0:5; % xi = fi
            actual = differenzeDivise(tC.xi, tC.xi);
            expected = [0, 1, 0, 0, 0, 0];
            tC.verifyEqual(actual, expected);
        end
       
        function testByExerciseTwo(tC)
            % Compito 05.07.16 (Newton)
            actual = differenzeDivise(tC.xi, tC.fi);
            expected = [1, -1, 1, 0, 0];
            tC.verifyEqual(actual, expected);
        end
        
        function interpNodesEstimationsMismatch(tC)
            wrongXi = 1;
            actual = @()differenzeDivise(wrongXi, tC.fi);
            expected = "differenzeDivise:" + ...
                       "InterpolationNodesNumberMismatch";
            tC.assertError(actual,expected);  
        end
    end
end
