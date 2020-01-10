classdef ChebyTest < matlab.unittest.TestCase
    
    properties
       
    end
    
    methods (Test)
        
        function testByExercise(tC)
            % Compito 08.06.16 es. 3:
            i = 0;
            expected = cos( (1 + (i : 2 : 10)) * pi/12);
            % dalla soluzione dell'esercizio
            expected = (5 * expected + 5)/2;
            
            actual = cheby(5, 0, 5);
            tC.verifyEqual(actual, expected);
        end
    end
end