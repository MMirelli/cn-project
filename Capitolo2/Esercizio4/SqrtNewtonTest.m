classdef SqrtNewtonTest < matlab.unittest.TestCase
    
    properties
        x0, itmax, alpha
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.x0 = 5;
            tC.itmax = 1000;
            tC.alpha = 16;
        end
        
    end
    
    methods (Test)
        function invalidAlpha(tC)
            expected = 'sqrtNewton:NotPositiveAlpha';
            actual = @()sqrtNewton(tC.x0, tC.itmax, -1);
            tC.assertError(actual, expected);
        end
        
        function sqrtNine(tC)
            actual = sqrtNewton(tC.x0, tC.itmax, tC.alpha);
            expected = sqrt(tC.alpha);
            tC.verifyEqual(actual, expected)
        end
    end
    
end

