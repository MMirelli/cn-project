classdef NewtonTest < matlab.unittest.TestCase
    
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
        
        function interpNodesEstimationsMismatch(tC)
            wrongXi = 1;
            actual = @()newton(wrongXi, tC.fi, tC.xi);
            expected = 'newton:InterpolationNodesNumberMismatch';
            tC.assertError(actual,expected);
        end
    end
    
end
