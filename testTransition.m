% TEST testTransitionIndex FUNCTION
%
% This function is designed to take a given controlled testTransitionIndex
% (1,3,5,..,etc) and the current marking (state) and return a TRUE == 1 or
% a FALSE == 0 in terms of feasiblity. This information used by the
% findFeasibleControlledEvents function to discover all feasible events to
% find feasible events in the neighbourhood.

function [feasible] = testTransition(testTransitionIndex, SYSTEM)

% NOTES
% A testTransitionIndex basically means that the place in which the token goes from
% goes down by 1 and the one that it goes to goes up by 1.

% RULE_SET_TOTYPE = RULE_SET(testTransitionIndex, 4);
% RULE_SET_FROMTYPE = RULE_SET(testTransitionIndex, 3);
% RULE_SET_TO = RULE_SET(testTransitionIndex, 2);
% RULE_SET_FROM = RULE_SET(testTransitionIndex, 1);

% BECAUSE WE'RE TESTING eC, its ALWAYS going from a queue to a workcenter

% Set feasible as default 0
feasible = uint8(0);

% CH
% FROM (-1)
switch SYSTEM.RULE_SET(testTransitionIndex, 1)
    % A TYPES
    case 1
        % A1 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.A1.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
    case 2
        % A2 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.A2.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
    % B TYPES    
    case 4
        % B1 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.B1.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
    case 5
        % B2 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.B2.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
   % C TYPES
   case 7
        % C1 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.C1.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
    case 8
        % C2 TYPE
        % IF THE QUEUE HAS ONE OR MORE
        if SYSTEM.C2.VOLUME >= 1
            feasible = uint8(1);
        else
            feasible = uint8(0);
            return
        end
end

% THIS CODE IS BEASTY
% TO (+1)
resourceType = 0;
resourceIndex = 1;
targetResource = SYSTEM.RULE_SET(testTransitionIndex, 2);
PERMUTATION = SYSTEM.SYS_PERMUTATION;

while targetResource ~= 0
    resourceType = resourceType + 1;
    resourceIndex = 1;
    if PERMUTATION(resourceType) > 0
        while PERMUTATION(resourceType) > 0
            targetResource = targetResource - 1;
            resourceIndex = resourceIndex + 1;
            PERMUTATION(resourceType) = PERMUTATION(resourceType) - 1;
            if targetResource == 0
                break
            end
        end
    end
end
resourceIndex = resourceIndex - 1;

switch SYSTEM.RULE_SET(testTransitionIndex, 1)
    case 1
        taskTypeQueue = 'A1';
    case 2
        taskTypeQueue = 'A2';
    case 4
        taskTypeQueue = 'B1';
    case 5
        taskTypeQueue = 'B2';
    case 7
        taskTypeQueue = 'C1';
    case 8
        taskTypeQueue = 'C2';
end

switch resourceType
    case 1
        % R1 RESOURCE
        if SYSTEM.R1(resourceIndex).STATE == true
            feasible = uint8(0);
        end
    case 2
        % R2 RESOURCE
        if SYSTEM.R2(resourceIndex).STATE == true
            feasible = uint8(0);
        end
    case 3
        % R3 RESOURCE
        if SYSTEM.R3(resourceIndex).STATE == true
            feasible = uint8(0);
        end
    case 4
        % R4 RESOURCE
        if SYSTEM.R4(resourceIndex).STATE == true
            feasible = uint8(0);
        end
    case 5
        % R5 RESOURCE
        if SYSTEM.R5(resourceIndex).STATE == true
            feasible = uint8(0);
        end
end

%% DEBUGGER
% disp("_________________________");
% disp("CONTROLLED EVENT: " + testTransitionIndex);
% disp("USES TASK TYPE QUEUE: " + taskTypeQueue);
% disp("USES RESOURCE TYPE; R" + resourceType + " WITH INDEX: " + resourceIndex);

end

