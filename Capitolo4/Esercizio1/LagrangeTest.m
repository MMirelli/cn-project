classdef LagrangeTest < matlab.unittest.TestCase
    
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
        
        function interpolationNodes(tC)
            actual = lagrange(tC.xi, tC.fi, tC.xi);
            expected = tC.fi;
            tC.verifyEqual(actual, expected);
        end
       
        function otherAxes(tC)
            % Compito 05.07.16 (Lagrange)
            x = [4, 5];
            expected = [16, 25];
            actual = lagrange(tC.xi, tC.fi, x);
            tC.verifyEqual(actual, expected);
        end
        
        function interpNodesEstimationsMismatch(tC)
            wrongXi = 1;
            actual = @()lagrange(wrongXi, tC.fi, tC.xi);
            expected = 'lagrange:InterpolationNodesNumberMismatch';
            tC.assertError(actual,expected);  
        end
        
        function manyEqualInterpNodes(tC)
            wrongXi = [-1, 0, 2, 2, 3];
            actual = @()lagrange(wrongXi, tC.fi, tC.xi);
            expected = 'l_kn_x:ManyEqualInterpolationNodes';
            tC.assertError(actual,expected);  
        end
    end
end

