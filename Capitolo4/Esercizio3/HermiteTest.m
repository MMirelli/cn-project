classdef HermiteTest < matlab.unittest.TestCase
    
    properties
        xi, fi, f1i
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.xi = [0 1];
            tC.fi = [1 2];
            tC.f1i = [2 1];
        end
    end
    
    methods (Test)
        function interpPoint1(tC)
            actual = hermite(tC.xi, tC.fi, tC.f1i, tC.xi(1));
            expected = tC.fi(1);
            tC.verifyEqual(actual, expected);
        end
        
        function halfPoint(tC)
            actual = hermite(tC.xi, tC.fi, tC.f1i, 0.5);
            expected = 1.6250;
            tC.verifyEqual(actual, expected);
        end
        
        function interpPoint2(tC)
            actual = hermite(tC.xi, tC.fi, tC.f1i, tC.xi(2));
            expected = tC.fi(2);
            tC.verifyEqual(actual, expected);
        end
    end
end

