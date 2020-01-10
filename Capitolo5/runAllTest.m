import matlab.unittest.TestSuite;

D = dir; % A is a struct ... first elements are '.' and '..' used for navigation.
total = matlab.unittest.Test.empty(0,0);
for k = 3:length(D) % avoid using the first ones
    
    currD = D(k).name; % Get the current subdirectory name
    
    if isfolder(currD)
        current = matlab.unittest.TestSuite.fromFolder(currD);
        total = [total current];
    end
end
totalResults = run(total);
disp(totalResults);