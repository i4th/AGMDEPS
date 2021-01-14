function [ SYSTEM ] = fireUc(SELECTED_uC, SYSTEM)

% In this function what we have is the UNCONTROLLED EVENT being executed. In
% which case what effects we expect to see are:
%   1) Find out what resource type and which resource index is.
%   2) Change in the STATE of the respective resource (1 -> 0).
%   3) Increment the volume of the TO place (task queue).

%% SETUP & PROCESSING TIME

% THIS CODE IS BEASTY
% FROM RESOURCE (-1)
resourceType = 0;
resourceIndex = 1;
leavingResource = SYSTEM.RULE_SET(SELECTED_uC, 1);
PERMUTATION = SYSTEM.SYS_PERMUTATION;

while leavingResource ~= 0
    resourceType = resourceType + 1;
    resourceIndex = 1;
    if PERMUTATION(resourceType) > 0
        while PERMUTATION(resourceType) > 0
            leavingResource = leavingResource - 1;
            resourceIndex = resourceIndex + 1;
            PERMUTATION(resourceType) = PERMUTATION(resourceType) - 1;
            if leavingResource == 0
                break
            end
        end
    end
end
resourceIndex = resourceIndex - 1;

switch SYSTEM.RULE_SET(SELECTED_uC, 2)
    case 1
        taskTypeQueue = 'A1';
        % This one obviously will never happen!
        SYSTEM.A1.VOLUME = SYSTEM.A1.VOLUME + 1;
    case 2
        taskTypeQueue = 'A2';
        SYSTEM.A2.VOLUME = SYSTEM.A2.VOLUME + 1;
    case 3
        taskTypeQueue = 'A3';
        SYSTEM.A3.VOLUME = SYSTEM.A3.VOLUME + 1;
    case 4
        taskTypeQueue = 'B1';
        SYSTEM.B1.VOLUME = SYSTEM.B1.VOLUME + 1;
    case 5
        taskTypeQueue = 'B2';
        SYSTEM.B2.VOLUME = SYSTEM.B2.VOLUME + 1;
    case 6
        taskTypeQueue = 'B3';
        SYSTEM.B3.VOLUME = SYSTEM.B3.VOLUME + 1;
    case 7
        taskTypeQueue = 'C1';
        SYSTEM.C1.VOLUME = SYSTEM.C1.VOLUME + 1;
    case 8
        taskTypeQueue = 'C2';
        SYSTEM.C2.VOLUME = SYSTEM.C2.VOLUME + 1;
    case 9
        taskTypeQueue = 'C3';
        SYSTEM.C3.VOLUME = SYSTEM.C3.VOLUME + 1;
end

% UPDATE THE RESOURCE STATE
switch resourceType
    case 1
        % R1 RESOURCE
        % CHANGE RESOURCE STATE
         SYSTEM.R1(resourceIndex).STATE = false;
    case 2
        % R2 RESOURCE
        % CHANGE RESOURCE STATE
         SYSTEM.R2(resourceIndex).STATE = false;
    case 3
        % R3 RESOURCE
        % CHANGE RESOURCE STATE
         SYSTEM.R3(resourceIndex).STATE = false;
    case 4
        % R4 RESOURCE
        % CHANGE RESOURCE STATE
         SYSTEM.R4(resourceIndex).STATE = false;
    case 5
        % R5 RESOURCE
        % CHANGE RESOURCE STATE
         SYSTEM.R5(resourceIndex).STATE = false;
end

%% DEBUGGER 
% disp("_________________________");
% disp("UNCONTROLLED EVENT: " + SELECTED_uC);
% disp("USES TASK TYPE QUEUE: " + taskTypeQueue);
% disp("USES RESOURCE TYPE; R" + resourceType + " WITH INDEX: " + resourceIndex);

end