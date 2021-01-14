function [ TOTAL_PROCESSING_TIME, TOTAL_CON_SWIT_TIME, TOTAL_MAKESPAN_TIME, t, SYSTEM, UEP_MATRIX, UEP_INDICATOR ] = step(TOTAL_PROCESSING_TIME, TOTAL_CON_SWIT_TIME, TOTAL_MAKESPAN_TIME, SYSTEM, UEP_MATRIX, UEP_INDICATOR, t)

% UNCONTROLLED EVENT SECTION
% Check UEP for events first, then apply
SELECTED_uC = uint16(2);
if UEP_INDICATOR(t) > 0
    while UEP_INDICATOR(t) > 0
        while SELECTED_uC <= SYSTEM.NO_POS_EVENTS
            if UEP_MATRIX(t,SELECTED_uC) >= 1
                % DEBUGGER
                %disp("ATTEMPTING FIRING (UC): " + SELECTED_uC + " AT TIME: " + t);
                
                % FIRE TRANSITION
                [ SYSTEM ] = fireUc(SELECTED_uC, SYSTEM);
                
                % REDUCE INDICATOR BY 1
                UEP_INDICATOR(t) = UEP_INDICATOR(t) - 1;
                
                % REDUCE EVENT CONTROLLER BY 1
                UEP_MATRIX(t,SELECTED_uC) = UEP_MATRIX(t,SELECTED_uC) - 1;
            end
            SELECTED_uC = SELECTED_uC + 2;
        end
    end
end

% CHECK IF ITS FINISHED
if (SYSTEM.A3.VOLUME == 100) && (SYSTEM.B3.VOLUME == 100) && (SYSTEM.C3.VOLUME == 100)
    TOTAL_MAKESPAN_TIME = t;
    return
end

% IF UNCONTROLLED EVENTS HAVE OCCURED, REDISCOVER THE NEIGHBOURHOOD
[SYSTEM] = discoverNeighbourhood(SYSTEM);

%% CONTROLLED EVENT SECTION

% IF THERE ARE NO AVAILABLE POSSIBLE CONTROLLED EVENTS JUST SACK IT OFF
if SYSTEM.NEIGHBOURHOOD.SIZE == 0
    return
end
 
% DEBUGGER
attemptedActions = 0;

% While SYSTEM.NEIGHBOURHOOD.SIZE ~= 0 KEEP FIRING CONTROLLED EVENTS
while SYSTEM.NEIGHBOURHOOD.SIZE >= 1
    % DEBUGGER
    %disp("______________________________________");
    %disp("NEIGHBOURHOOD SIZE IS: " +SYSTEM.NEIGHBOURHOOD.SIZE);
    
    % SELECT AN EVENT
    % MONTE CARLO CONTROLLED EVENT SELECTION
    [ SELECTED_eC ] = selectEc(SYSTEM);
    
    % FIRE THE EVENT
    [ SYSTEM, totalTime, processingTime, setupTime ] = fireEc(SELECTED_eC, SYSTEM);
    
    % UPDATE STATS
    TOTAL_PROCESSING_TIME = TOTAL_PROCESSING_TIME + processingTime;
    TOTAL_CON_SWIT_TIME = TOTAL_CON_SWIT_TIME + setupTime;
    
    % ADD COUNTERPART UNCONTROLLED EVENT TO UEP_INDICATOR & UEP_MATRIX
    FUTURE_uC = SELECTED_eC + 1;
    
    if (t + totalTime) < SYSTEM.EPISODE_LENGTH
        UEP_INDICATOR(t + totalTime) = UEP_INDICATOR(t + totalTime) + 1;
        UEP_MATRIX((t + totalTime),FUTURE_uC) = UEP_MATRIX((t + totalTime),FUTURE_uC) + 1;
    end
    
    % DEBUGGER
    attemptedActions = attemptedActions + 1;
    %disp("ATTEMPED ACTIONS: " + attemptedActions);
    
    % REDISCOVER NEIGHBOURHOOD
    [SYSTEM] = discoverNeighbourhood(SYSTEM);
end