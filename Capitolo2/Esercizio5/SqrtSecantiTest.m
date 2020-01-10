classdef SqrtSecantiTest < matlab.unittest.TestCase
    
    properties
        x0, x1, itmax, alpha
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.x0 = 5;
            tC.x1 = 3;
            tC.itmax = 1000;
            tC.alpha = 5;
        end
        
    end
    
    methods (Test)
        function invalidAlpha(tC)
            expected = 'sqrtSecanti:NotPositiveAlpha';
            actual = @()sqrtSecanti(tC.x0, tC.x1, tC.itmax, -1);
            tC.assertError(actual, expected);
        end
        
        function sqrtNine(tC)
            actual = sqrtSecanti(tC.x0, tC.x1, tC.itmax, tC.alpha);
            expected = sqrt(tC.alpha);
            tC.verifyEqual(actual, expected)
        end
    end
    
end