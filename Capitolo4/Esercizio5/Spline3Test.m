classdef Spline3Test < matlab.unittest.TestCase
    
    properties
        xi, xx, rTol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.xi = -2 : 2;
            tC.xx = -2:.25:2;
            tC.rTol = 1e-10;
        end
    end
    
    methods (Test)
        function interpNodesEstimationsMismatch(tC)
            wrongFi = 1;
            actual = @()spline3(tC.xi, wrongFi, 0, 'nat');
            expected = 'spline3:InterpolationNodesNumberMismatch';
            tC.assertError(actual, expected);  
        end
        
        function manyEqualInterpNodes(tC)
            wrongXi = [-1, 0, 2, 2, 3];
            actual = @()spline3(wrongXi, sin(wrongXi), 0, 'nak');
            expected = 'spline3:ManyEqualInterpolationNodes';
            tC.assertError(actual, expected);  
        end
        
        function wrongSplineTypes(tC)
            actual = @()spline3(0, 0, 0, 'wrong');
            expected = 'spline3:WrongSplineType';
            tC.assertError(actual, expected);  
        end
        
        function interpSinNat(tC)
            actual = spline3(tC.xi, sin(tC.xi), tC.xi, 'nat');
            tC.verifyEqual(sin(tC.xi), actual, 'RelTol', tC.rTol)
        end
        
        function interpSinNak(tC)
            actual = spline3(tC.xi, sin(tC.xi), tC.xx, 'nak');
            expected = spline(tC.xi, sin(tC.xi), tC.xx);
            tC.verifyEqual(expected, actual, 'RelTol', tC.rTol)
        end
        
        function interpCosNat(tC)
            actual = spline3(tC.xi, cos(tC.xi), tC.xi, 'nat');
            tC.verifyEqual(cos(tC.xi), actual, 'RelTol', tC.rTol)
        end
        
        function interpCosNak(tC)
            actual = spline3(tC.xi, cos(tC.xi), tC.xx, 'nak');
            expected = spline(tC.xi, cos(tC.xi), tC.xx);
            tC.verifyEqual(expected, actual, 'RelTol', tC.rTol)
        end
        
        function interpExpNat(tC)
            actual = spline3(tC.xi, exp(tC.xi), tC.xi, 'nat');
            tC.verifyEqual(exp(tC.xi), actual, 'RelTol', tC.rTol)
        end
        
        function interpExpNak(tC)
            actual = spline3(tC.xi, exp(tC.xi), tC.xx, 'nak');
            expected = spline(tC.xi, exp(tC.xi), tC.xx);
            tC.verifyEqual(expected, actual, 'RelTol', tC.rTol)
        end
    end
end

