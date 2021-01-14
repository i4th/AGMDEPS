
% LOAD CAPABILITY MATRIX
load('resourceCapabilityMatrix.mat');

% No Resource Types
totalNumberOfResourceInstanceTypes = 5;

j = 1;
PERMUTATION = [1 1 1 1 0];

% TEST PERMUTATION
z = 1;
feasibleContainer = zeros(1,6,'uint8');
while z <= totalNumberOfResourceInstanceTypes
    if PERMUTATION(j,z) ~= 0
        g = 1;
        while g <= 6
            if resourceCapabilityMatrix(z,g) == true
                feasibleContainer(g) = 1;
            end
            % ITERATE OVER THE RESOURCE CAPABILITY MATRIX
            g = g + 1;
        end
        if sum(feasibleContainer) == 6
            DATA.FEASIBLE(j) = true;
        end
    end
    
    disp(feasibleContainer);
    pause(3);
    
    % ITERATE RESOURCE TYPE INDEX
    z = z + 1;
end

