classdef SimpcompTest < matlab.unittest.TestCase
    
    properties
        a, b, n, f, rTol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.a = 0;
            tC.b = 10;
            tC.n = 1000;
            tC.f = @(x) sin(x);
            tC.rTol = 1e-10;
        end
        
    end
    
    methods (Test)
        function integrationLimits(tC)
            % test: a > b
            wrongB = -10;            
            actual = @()simpcomp(tC.n, tC.a, wrongB, tC.f);
            expected = 'simpcomp:UnorderedIntegrationLimits';
            tC.assertError(actual,expected);
            % test: a = b 
            bEqualA = tC.a;
            actual = simpcomp(2, tC.a, bEqualA, tC.f);
            expected = 0;
            tC.verifyEqual(actual,expected);
        end
        
        function invalidNumberOfPolynomials(tC)
            expected = 'simpcomp:InvalidNumberOfPolynomials';

            wrongN = -5;            
            actual = @()simpcomp(wrongN, tC.a, tC.b, tC.f);
            tC.assertError(actual,expected);
            
            wrongN = 0;
            actual = @()simpcomp(wrongN, tC.a, tC.b, tC.f);
            tC.assertError(actual,expected);
        end
        
        function sinIntegration(tC)
            expected = integral(tC.f, tC.a, tC.b);
            
            actual = simpcomp(tC.n, tC.a, tC.b, tC.f);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
           
        function cosIntegration(tC)
            fCos = @(x) cos(x);
            expected = integral(fCos, tC.a, tC.b);
            
            actual = simpcomp(tC.n, tC.a, tC.b, fCos);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
        
        function expIntegration(tC)
            fExp = @(x) exp(x);
            expected = integral(fExp, tC.a, tC.b);
            
            actual = simpcomp(tC.n, tC.a, tC.b, fExp);
            tC.verifyEqual(actual, expected, 'RelTol', tC.rTol);
        end
        
    end
    
end