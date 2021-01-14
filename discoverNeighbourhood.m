%% UNCERTAINTY QUANTIFICATION SYSTEM
%
% NODE NEIGHTBOURHOOD DISCOVER
%
% This function takes the current state or marking 'm' and returns all
% Valid Controlled Events

function [SYSTEM] = discoverNeighbourhood(SYSTEM)

SYSTEM.NEIGHBOURHOOD.SIZE = uint8(0);
SYSTEM.NEIGHBOURHOOD.STRUCT = logical(sparse(zeros(SYSTEM.NO_POS_EVENTS,1)));

% RULE SET SIZE
RULE_SET_SIZE = SYSTEM.NO_POS_EVENTS;

% TESTING LOOP
testTransitionIndex = uint16(1);

% START OF LOOP
while testTransitionIndex <= RULE_SET_SIZE  
        % RUN FUNCTION
        [feasible] = testTransition(testTransitionIndex, SYSTEM);
        if feasible == 1
            % DEBUGGER
            %disp(testTransitionIndex + " FEASIBLE");
            
            % MARK TRANSITION AS TRUE (1) & INCREASE SIZE OF FEASIBLE VAR
            SYSTEM.NEIGHBOURHOOD.STRUCT(testTransitionIndex) = 1;
            SYSTEM.NEIGHBOURHOOD.SIZE = SYSTEM.NEIGHBOURHOOD.SIZE + 1;
        else
            % DEBUGGER
            %disp(testTransitionIndex + " NOT FEASIBLE");
        end
        testTransitionIndex = testTransitionIndex + 2;
end


end

