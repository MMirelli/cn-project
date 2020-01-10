classdef TrapadTest < matlab.unittest.TestCase
    
    properties
        a, b, f, tol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.a = 0;
            tC.b = 20;
            tC.tol = 1e-5;
        end
        
    end
    
    methods (Test)
        function integrationLimits(tC)
            % test: a > b
            wrongB = -10;            
            actual = @()trapad(tC.a, wrongB, @(x) x, tC.tol);
            expected = 'trapad:UnorderedIntegrationLimits';
            tC.assertError(actual, expected);
            % test: a = b 
            bEqualA = tC.a;
            actual = trapad(tC.a, bEqualA, @(x) x, tC.tol);
            expected = 0;
            tC.verifyEqual(actual, expected);
        end        
        
        function sinIntegration(tC)
            expected = integral(@(x) sin(x), tC.a, tC.b);           
            actual = trapad(tC.a, tC.b, @(x) sin(x), tC.tol);
            tC.verifyEqual(actual, expected, 'AbsTol', tC.tol);
        end
        
        function cosIntegration(tC)
            expected = integral(@(x) cos(x), tC.a, tC.b);           
            actual = trapad(tC.a, tC.b, @(x) cos(x), tC.tol);
            tC.verifyEqual(actual, expected, 'AbsTol', tC.tol);
        end
        
        function expIntegration(tC)
            tC.b = 10;
            expected = integral(@(x) exp(x), tC.a, tC.b);           
            actual = trapad(tC.a, tC.b, @(x) exp(x), tC.tol);
            tC.verifyEqual(actual, expected, 'AbsTol', tC.tol);
        end
    end
    
end

