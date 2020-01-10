classdef TrapCompTest < matlab.unittest.TestCase
    
    properties
        a, b, n, rTol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.a = 0;
            tC.b = 10;
            tC.n = 1000;
            tC.rTol = 1e-5;
        end
        
    end
    
    methods (Test)
        function integrationLimits(tC)
            % test: a > b
            wrongB = -10;            
            actual = @()trapcomp(tC.n, tC.a, wrongB, @(x) cos(x));
            expected = 'trapcomp:UnorderedIntegrationLimits';
            tC.assertError(actual, expected);

            % test: a = b 
            bEqualA = tC.a;
            actual = trapcomp(2, tC.a, bEqualA, @(x) sin(x));
            expected = 0;
            tC.verifyEqual(actual, expected);
        end
        
        function invalidNumberOfPolynomials(tC)
            expected = 'trapcomp:InvalidNumberOfSubintervals';

            wrongN = -5;            
            actual = @()trapcomp(wrongN, tC.a, tC.b, @(x) exp(x));
            tC.assertError(actual, expected);
            
            wrongN = 0;
            actual = @()trapcomp(wrongN, tC.a, tC.b, @(x) cos(x));
            tC.assertError(actual, expected);
        end
        
        function sinIntegration(tC)
            fSin = @(x) sin(x);
            expected = integral(fSin, tC.a, tC.b);
            
            actual = trapcomp(tC.n, tC.a, tC.b, fSin);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
           
        function cosIntegration(tC)
            fCos = @(x) cos(x);
            expected = integral(fCos, tC.a, tC.b);
            
            actual = trapcomp(tC.n, tC.a, tC.b, fCos);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
        
        function expIntegration(tC)
            fExp = @(x) exp(x);
            expected = integral(fExp, tC.a, tC.b);
            
            actual = trapcomp(tC.n, tC.a, tC.b, fExp);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
        
    end
    
end

