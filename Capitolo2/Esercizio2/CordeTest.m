classdef CordeTest < matlab.unittest.TestCase
    
    properties
        f, f1, x0, tol
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.f = @(x) x^3 - 4*x^2 + 5*x - 2;
            tC.f1 = @(x) 3*x^2 - 8*x + 5;
            tC.x0 = 3;
            tC.tol = 1e-10;
        end
        
    end
    
    methods (Test)
        
        function findZero(tC)
            actual = corde(tC.f, tC.f1, tC.x0, tC.tol);
            tC.verifyEqual(actual, 2, 'RelTol', tC.tol);
        end
    end
    
end

