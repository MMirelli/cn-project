classdef SimpadTest < matlab.unittest.TestCase
    
    properties
        a, b, f, tol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.a = 1/100;
            tC.b = 100;
            tC.f = @(x)-2.*(x.^-3).*cos(x.^-2);
            tC.tol = 1e-5;
        end
        
    end
    
    methods (Test)
        function integrationLimits(tC)
            % test: a > b
            wrongB = -10;            
            actual = @()simpad(tC.a, wrongB, tC.f, tC.tol);
            expected = 'simpad:UnorderedIntegrationLimits';
            tC.assertError(actual,expected);
            % test: a = b 
            bEqualA = tC.a;
            actual = simpad(tC.a, bEqualA, tC.f, tC.tol);
            expected = 0;
            tC.verifyEqual(actual,expected);
        end
        
        function f5_17BookIntegration(tC)
            expected = integral(tC.f, tC.a, tC.b);
            
            actual = simpad(tC.a, tC.b, tC.f, tC.tol);
            tC.verifyEqual(actual, expected, 'AbsTol', tC.tol);
        end
        
    end
    
end