classdef l_kn_xTest < matlab.unittest.TestCase
    
    properties
        xi
    end
    
    methods (TestMethodSetup)
        function setup(tC)
            tC.xi = [-1, 0, 1, 2, 3];
        end
    end
    
    methods (Test)
        
        function interpolationNodes (tC)
            % Compito 05.07.16 (Lagrange)
            expected = [1 0 0 0 0];
            actual = @(j) l_kn_x(j, tC.xi, tC.xi);
            tC.verifyEqual(actual(1), expected);
            for i = 2 : 5
                expected(i-1:i) = flip(expected(i-1:i));
                tC.verifyEqual(actual(i), expected);
                
            end
        end
        
        function kNotPositiveInt (tC)
            wrongIndex = -1;
            actual = @()l_kn_x(wrongIndex, tC.xi, tC.xi);
            expected = 'l_kn_x:NotPositiveKIndex';
            tC.assertError(actual,expected); 
        end
    end
end
