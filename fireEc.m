function [ SYSTEM, totalTime, processingTime, setupTime ] = fireEc(SELECTED_eC, SYSTEM)


% In this function what we have is the CONTROLLED EVENT being executed. In
% which case what effects we expect to see are:
%   1) Find out what resource type and which resource index is.
%   2) Possible change in the MODE of the respective resource.
%   3) Change in the STATE of the respective resource (0 -> 1)

%% SETUP & PROCESSING TIME
% FIND WHICH RESOURCE WE ARE USING
% THIS CODE IS BEASTY
% FROM RESOURCE (-1)
resourceType = 0;
resourceIndex = 1;
targetResource = SYSTEM.RULE_SET(SELECTED_eC, 2);
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

switch resourceType
    % RESOURCE R1
    case 1
        % FIND CURRENT MODE
        ROW = SYSTEM.R1(resourceIndex).MODE;
        
        % CHANGE RESOURCE STATE
        SYSTEM.R1(resourceIndex).STATE = true;
        %disp("R1 STATE: RUNNING");
        
        % FIND NEW MODE
        switch SYSTEM.RULE_SET(SELECTED_eC, 1)
            case 1
                COLUMN = 1;
                % UPDATE MODE
                SYSTEM.R1(resourceIndex).MODE = 1;
                %disp("R1 MODE: A1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.A1.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.A1.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.A1.VOLUME = SYSTEM.A1.VOLUME - 1;
                %disp("A1 VOLUME DECREASED.");
            case 2
                COLUMN = 2;
                % UPDATE MODE
                SYSTEM.R1(resourceIndex).MODE = 2;
                %disp("R1 MODE: A2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.A2.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.A2.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.A2.VOLUME = SYSTEM.A2.VOLUME - 1;
                %disp("A2 VOLUME DECREASED.");
            case 5
                COLUMN = 3;
                % UPDATE MODE
                SYSTEM.R1(resourceIndex).MODE = 3;
                %disp("R1 MODE: B2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B2.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.B2.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B2.VOLUME = SYSTEM.B2.VOLUME - 1;
                %disp("B2 VOLUME DECREASED.");
        end
        % SETUP/CONTEXT SWITCHING TIME
        setupTime = uint32(SYSTEM.R1(resourceIndex).CONTEXT_SWITCH_MAP(ROW, COLUMN));
               
        % RESOURCE R2
    case 2
        % FIND CURRENT MODE
        ROW = SYSTEM.R2(resourceIndex).MODE;
        
        % CHANGE RESOURCE STATE
        SYSTEM.R2(resourceIndex).STATE = true;
        %disp("R2 STATE: RUNNING");
        
        % FIND NEW MODE
        switch SYSTEM.RULE_SET(SELECTED_eC, 1)
            case 2
                COLUMN = 1;
                % UPDATE MODE
                SYSTEM.R2(resourceIndex).MODE = 1;
                %disp("R2 MODE: A2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.A2.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.A2.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.A2.VOLUME = SYSTEM.A2.VOLUME - 1;
                %disp("A2 VOLUME DECREASED.");
            case 4
                COLUMN = 2;
                % UPDATE MODE
                SYSTEM.R2(resourceIndex).MODE = 2;
                %disp("R2 MODE: B1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B1.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.B1.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B1.VOLUME = SYSTEM.B1.VOLUME - 1;
                %disp("B1 VOLUME DECREASED.");
            case 8
                COLUMN = 3;
                % UPDATE MODE
                SYSTEM.R2(resourceIndex).MODE = 3;
                %disp("R2 MODE: C2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.C2.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.C2.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.C2.VOLUME = SYSTEM.C2.VOLUME - 1;
                %disp("C2 VOLUME DECREASED.");
        end
        % SETUP/CONTEXT SWITCHING TIME
        setupTime = uint32(SYSTEM.R2(resourceIndex).CONTEXT_SWITCH_MAP(ROW, COLUMN));
        
        % RESOURCE R3
    case 3
        % FIND CURRENT MODE
        ROW = SYSTEM.R3(resourceIndex).MODE;
        
        % CHANGE RESOURCE STATE
        SYSTEM.R3(resourceIndex).STATE = true;
        %disp("R3 STATE: RUNNING");
        
        % FIND NEW MODE
        switch SYSTEM.RULE_SET(SELECTED_eC, 1)
            case 1
                COLUMN = 1;
                % UPDATE MODE
                SYSTEM.R3(resourceIndex).MODE = 1;
                %disp("R3 MODE: A1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.A1.DISTRIBUTION(2).VARIANCE.*randn + SYSTEM.A1.DISTRIBUTION(2).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.A1.VOLUME = SYSTEM.A1.VOLUME - 1;
                %disp("A1 VOLUME DECREASED.");
            case 4
                COLUMN = 2;
                % UPDATE MODE
                SYSTEM.R3(resourceIndex).MODE = 2;
                %disp("R3 MODE: B1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B1.DISTRIBUTION(2).VARIANCE.*randn + SYSTEM.B1.DISTRIBUTION(2).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B1.VOLUME = SYSTEM.B1.VOLUME - 1;
                %disp("B2 VOLUME DECREASED.");
            case 7
                COLUMN = 3;
                % UPDATE MODE
                SYSTEM.R3(resourceIndex).MODE = 3;
                %disp("R3 MODE: C1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.C1.DISTRIBUTION(1).VARIANCE.*randn + SYSTEM.C1.DISTRIBUTION(1).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.C1.VOLUME = SYSTEM.C1.VOLUME - 1;
                %disp("C1 VOLUME DECREASED.");
        end
        % SETUP/CONTEXT SWITCHING TIME
        setupTime = uint32(SYSTEM.R3(resourceIndex).CONTEXT_SWITCH_MAP(ROW, COLUMN));
        
        % RESOURCE R4
    case 4
        % FIND CURRENT MODE
        ROW = SYSTEM.R4(resourceIndex).MODE;
        
        % CHANGE RESOURCE STATE
        SYSTEM.R4(resourceIndex).STATE = true;
        %disp("R4 STATE: RUNNING");
        
        % FIND NEW MODE
        switch SYSTEM.RULE_SET(SELECTED_eC, 1)
            case 1
                COLUMN = 1;
                % UPDATE MODE
                SYSTEM.R4(resourceIndex).MODE = 1;
                %disp("R4 MODE: A1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.A1.DISTRIBUTION(3).VARIANCE.*randn + SYSTEM.A1.DISTRIBUTION(3).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.A1.VOLUME = SYSTEM.A1.VOLUME - 1;
                %disp("A1 VOLUME DECREASED.");
            case 4
                COLUMN = 2;
                % UPDATE MODE
                SYSTEM.R4(resourceIndex).MODE = 2;
                %disp("R4 MODE: B1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B1.DISTRIBUTION(3).VARIANCE.*randn + SYSTEM.B1.DISTRIBUTION(3).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B1.VOLUME = SYSTEM.B1.VOLUME - 1;
                %disp("B1 VOLUME DECREASED.");
            case 5
                COLUMN = 3;
                % UPDATE MODE
                SYSTEM.R4(resourceIndex).MODE = 3;
                %disp("R4 MODE: B2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B2.DISTRIBUTION(2).VARIANCE.*randn + SYSTEM.B2.DISTRIBUTION(2).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B2.VOLUME = SYSTEM.B2.VOLUME - 1;
                %disp("B2 VOLUME DECREASED.");
            case 8
                COLUMN = 4;
                % UPDATE MODE
                SYSTEM.R4(resourceIndex).MODE = 4;
                %disp("R4 MODE: C2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.C2.DISTRIBUTION(2).VARIANCE.*randn + SYSTEM.C2.DISTRIBUTION(2).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.C2.VOLUME = SYSTEM.C2.VOLUME - 1;
                %disp("C2 VOLUME DECREASED.");
        end
        % SETUP/CONTEXT SWITCHING TIME
        setupTime = uint32(SYSTEM.R4(resourceIndex).CONTEXT_SWITCH_MAP(ROW, COLUMN));
        
        % RESOURCE R5
    case 5
        % FIND CURRENT MODE
        ROW = SYSTEM.R5(resourceIndex).MODE;
        
        % CHANGE RESOURCE STATE
        SYSTEM.R5(resourceIndex).STATE = true;
        %disp("R5 STATE: RUNNING");
        
        % FIND NEW MODE
        switch SYSTEM.RULE_SET(SELECTED_eC, 1)
            case 4
                COLUMN = 1;
                % UPDATE MODE
                SYSTEM.R5(resourceIndex).MODE = 1;
                %disp("R5 MODE: B1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B1.DISTRIBUTION(4).VARIANCE.*randn + SYSTEM.B1.DISTRIBUTION(4).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B1.VOLUME = SYSTEM.B1.VOLUME - 1;
                %disp("B1 VOLUME DECREASED.");
            case 5
                COLUMN = 2;
                % UPDATE MODE
                SYSTEM.R5(resourceIndex).MODE = 2;
                %disp("R5 MODE: B2");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.B2.DISTRIBUTION(3).VARIANCE.*randn + SYSTEM.B2.DISTRIBUTION(3).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.B2.VOLUME = SYSTEM.B2.VOLUME - 1;
                %disp("B2 VOLUME DECREASED.");
            case 7
                COLUMN = 3;
                % UPDATE MODE
                SYSTEM.R5(resourceIndex).MODE = 3;
                %disp("R5 MODE: C1");
                % PROCESSING TIME
                processingTime = uint32(round(SYSTEM.C1.DISTRIBUTION(2).VARIANCE.*randn + SYSTEM.C1.DISTRIBUTION(2).MEAN));
                % DECREMENT QUEUE VOLUME
                SYSTEM.C1.VOLUME = SYSTEM.C1.VOLUME - 1;
                %disp("C1 VOLUME DECREASED.");
        end
        % SETUP/CONTEXT SWITCHING TIME
        setupTime = uint32(SYSTEM.R5(resourceIndex).CONTEXT_SWITCH_MAP(ROW, COLUMN));
end

% TOTAL TIME
totalTime = setupTime + processingTime;

%% DEBUGGER 

% SETUP TIME DEBUGGERS
if setupTime == 0
    %disp("NO CONTEXT SWITCHING TIME; " + COLUMN + " & " + ROW + " ARE THE SAME.");
else
    %disp("CONTEXT SWITCHING TIME; " + setupTime);
end

% disp("FIRING: " + SELECTED_eC);
% disp("RESOURCE TYPE: " +  resourceType);
% disp("RESOURCE INDEX: " + resourceIndex);
% disp("PROCESSING TIME: " + processingTime);
% disp("TOTAL TIME: " + totalTime); 
end
