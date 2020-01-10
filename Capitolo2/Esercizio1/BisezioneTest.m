classdef BisezioneTest < matlab.unittest.TestCase
    
    properties
        a, b, f, rTol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.a = 0;
            tC.b = 3;
            tC.f = @(x)x^3-4*x^2+5*x-2;
            tC.rTol = 1e-20;
        end
        
    end
    
    methods (Test)
        function uncomputableSolutions(tC)
            wrongF = @(x) cos(x);
            wrongA = -pi;
            wrongB = pi;
            actual = @()bisezione(wrongF, wrongA, wrongB, tC.rTol);
            expected = 'bisezione:UncomputableSolution';
            tC.assertError(actual, expected);
        end
        
        function invalidItmaxValue(tC)
            wrongItmax = 1;
            actual = @() bisezione(tC.f, tC.a, tC.b, tC.rTol, ...
                                   wrongItmax);
            expected = 'bisezione:InvalidItmaxValue';
            tC.assertError(actual, expected);
        end
        
        function ex2_1(tC)
            actual = bisezione(tC.f, tC.a, tC.b, tC.rTol);
            expected = 2;
            tC.verifyEqual(actual, expected, 'RelTol', 1e-14);
        end
        
    end
    
end

