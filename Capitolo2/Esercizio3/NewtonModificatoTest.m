classdef NewtonModificatoTest < matlab.unittest.TestCase
    
    properties
        f, f1, m, x0, rTol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.f = @(x)x^3-4*x^2+5*x-2;
            tC.f1 = @(x)3*x^2-8*x+5;
            tC.m = 2;
            tC.x0 = 0;
            tC.rTol = 1e-15;
        end
        
    end
    
    methods (Test)
        function invalidMValue(tC)
            wrongM = 0;
            actual = @()newtonModificato(tC.f, tC.f1, wrongM, ...
                                         tC.x0, tC.rTol);
            expected = 'newtonModificato:InvalidMValue';
            tC.assertError(actual, expected);
        end
        
        function invalidItmaxValue(tC)
            wrongItmax = 0;
            actual = @()newtonModificato(tC.f, tC.f1, tC.m, ...
                                         tC.x0, tC.rTol, ...
                                         wrongItmax);
            expected = 'newtonModificato:InvalidItmaxValue';
            tC.assertError(actual, expected);
        end
        
        function ex2_3(tC)
            actual = newtonModificato(tC.f, tC.f1, tC.m, tC.x0, ...
                                      tC.rTol);
            expected = 1;
            tC.verifyEqual(actual, expected, 'RelTol', 1e-8);
        end
        
    end
    
end

