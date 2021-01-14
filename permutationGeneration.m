

% TYPES OF RESOURCES (5 - CAN'T CHANGE)
totalNumberOfResourceInstanceTypes = uint8(5);

% MAX NUMBER OF RESOURCES + 1 (e.g 5, 6, 7) DEFAULT 5
maxResourceInstances = uint16(6+1);

% NUMBER OF SHOTACHSTIC GENERATIONS
numberOfPermutations = uint32(100000);


DATA.FEAS_PERMS_PRESENT = zeros(numberOfPermutations,1,'logical');
DATA.PERMUTATIONS = zeros(numberOfPermutations,totalNumberOfResourceInstanceTypes, 'uint16');
DATA.FEASIBLE = zeros(numberOfPermutations,1,'logical');
DATA.FEAS_PERMS = zeros(numberOfPermutations,totalNumberOfResourceInstanceTypes, 'uint16');
load('resourceCapabilityMatrix.mat');

k = uint32(1);
j = uint32(1);
while j <= numberOfPermutations
    
    % GENERATE PERMUTATION
    i = uint8(1);
    remainingResourceInstances = maxResourceInstances;
    while i <= totalNumberOfResourceInstanceTypes
        if remainingResourceInstances == 0
            break
        end
        DATA.PERMUTATIONS(j,i) = randi(remainingResourceInstances)-1;
        remainingResourceInstances = remainingResourceInstances - DATA.PERMUTATIONS(j,i);
        i = i + 1;
    end
    
    % TEST PERMUTATION
    z = 1;
    feasibleContainer = zeros(1,6,'uint8');
    while z <= totalNumberOfResourceInstanceTypes
        if DATA.PERMUTATIONS(j,z) ~= 0
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
        
        % ITERATE RESOURCE TYPE INDEX
        z = z + 1;
    end
    
    % RESULTS
    if DATA.FEASIBLE(j) == true
        % DEBUGGER
        disp("_________________________________________");
        disp("FEASIBLE PERMUTATION INSTANCE INDEX: " + j + " - [" + num2str(DATA.PERMUTATIONS(j,:)) + "]");
        
        % CHECK IF IT IS A NOVEL CONFIGURATION
        [ NOVEL ] = checkNovelty(DATA.FEAS_PERMS,DATA.FEAS_PERMS_PRESENT,DATA.PERMUTATIONS(j,:),j);
        if NOVEL == true
            DATA.FEAS_PERMS(k,:) = DATA.PERMUTATIONS(j,:);
            DATA.FEAS_PERMS_PRESENT(k) = true;
            disp("NOVEL & FEASIBLE PERMUTATION INSTANCE INDEX: " + k);
            k = k + 1;
        end
    end
    
    
    % ITERATE PERMUTATION
    j = j + 1;
end


function [ NOVEL ] = checkNovelty(existingData,presenceOfExistingData,candidateData,j)

% IF ITS THE FIRST ONE THEN OBVIOUSLY IT'S NOVEL
if j == 1
    disp("NOVEL BECAUSE IT'S THE FIRST FEASIBLE ONE.");
    NOVEL = logical(true);
    return
end

% ASSUME IT ISN'T NOVEL
NOVEL = logical(false);

% SELECT EACH PREVIOUS PERMUTATION AT INDEX 'm'
m = 1;
while presenceOfExistingData(m) == true
    
    % BUILD A VECTOR TO RECORD IF IT IS NOVEL AGAINST THIS INSTANCE OF A
    % PREVIOUS PERMUTATION 'm'.
    DIFFERENCE = zeros(1,5,'logical');
    z = 1;
    while z <= 5
        if candidateData(z) ~= existingData(m,z)
            % ACTION
            DIFFERENCE(z) = logical(true);
        elseif candidateData(z) == existingData(m,z)
            % ACTION
            DIFFERENCE(z) = logical(false);
        end
        z = z + 1;
    end
    
    % BASED ON THE VECTOR, IF IT HAS ANY ELEMENTS THAT A TRUE THEN IT IS
    % INDEED NOVEL COMPARED TO THE INSTANCE 'm' OF A PREVIOUS PERMUTATION.
    state = "NOT OK";
    p = 1;
    while p <= 5
        if DIFFERENCE(p) == true
            NOVEL = logical(true);
            state = "OK";
        end
        p = p + 1;
    end
    
    % DEBUGGER
    DIFFERENCE_INT = uint8(DIFFERENCE);
    disp("NEW PERMUTATION: " + j + " - EXISTING PERMUTATION: " + m + " HAS A DIFFERENCE MATRIX OF: [ " + num2str(DIFFERENCE_INT) + "] - " + state);
    %pause(0.0001);
    
    % IF
    if state == "NOT OK"
        disp("DISCOVERED PERMUTATION IN A PRIOR INSTANCE: " + m);
        NOVEL = logical(false);
        break
    end
    
    % ITERATE OVER EXISTING FEASIBLE PERMUTATIONS
    m = m + 1;
end

end
