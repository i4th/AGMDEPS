function [ SYSTEM ] = buildSystemResourceObjects(SYSTEM, SYS_PERMUTATION)

% RULE SET DATA STRUCTURE CALCULATION

SYSTEM.NO_POS_EVENTS = uint32(6*SYS_PERMUTATION(1)+6*SYS_PERMUTATION(2)+6*SYS_PERMUTATION(3)+8*SYS_PERMUTATION(4)+6*SYS_PERMUTATION(5));
SYSTEM.RULE_SET = zeros(SYSTEM.NO_POS_EVENTS, 2, 'uint32');

ruleSet_row = uint16(1);
resourceCode = uint16(1);

% MAIN BODY 
index = uint16(1);
while index < 6
    if SYS_PERMUTATION(index) > 0
        instance = uint16(1);
        maxInstances = SYS_PERMUTATION(index);
        switch index
            % RESOURCE TYPE 1
            case 1
                while instance <= maxInstances
                    SYSTEM.R1(instance).STATE = false;
                    SYSTEM.R1(instance).MODE = uint8(1);
                    SYSTEM.R1(instance).CONTEXT_SWITCH_MAP = uint8([0 4 5; 8 0 9; 10 19 0]);
                    % RULE_SET
                    % A1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 1;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 2;
                    ruleSet_row = ruleSet_row + 2;
                    % A2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 2;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 3;
                    ruleSet_row = ruleSet_row + 2;
                    % B2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 5;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 6;
                    ruleSet_row = ruleSet_row + 2;
                    % INCREMENTS
                    instance = instance + 1;
                    resourceCode = resourceCode + 1;
                end
                % RESOURCE TYPE 2
            case 2
                while instance <= maxInstances
                    SYSTEM.R2(instance).STATE = false;
                    SYSTEM.R2(instance).MODE = uint8(1);
                    SYSTEM.R2(instance).CONTEXT_SWITCH_MAP = uint8([0 7 4; 4 0 5; 8 12 0]);
                    % RULE_SET
                    % A2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 2;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 3;
                    ruleSet_row = ruleSet_row + 2;
                    % B1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 4;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 4;
                    ruleSet_row = ruleSet_row + 2;
                    % C2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 8;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 9;
                    ruleSet_row = ruleSet_row + 2;
                    % INCREMENTS
                    instance = instance + 1;
                    resourceCode = resourceCode + 1;
                end
                % RESOURCE TYPE 3
            case 3
                while instance <= maxInstances
                    SYSTEM.R3(instance).STATE = false;
                    SYSTEM.R3(instance).MODE = uint8(1);
                    SYSTEM.R3(instance).CONTEXT_SWITCH_MAP = uint8([0 8 6; 18 0 14; 7 5 0]);
                    % RULE_SET
                    % A1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 1;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 2;
                    ruleSet_row = ruleSet_row + 2;
                    % B1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 4;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 5;
                    ruleSet_row = ruleSet_row + 2;
                    % C1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 7;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 8;
                    ruleSet_row = ruleSet_row + 2;
                    % INCREMENTS
                    instance = instance + 1;
                    resourceCode = resourceCode + 1;
                end
                % RESOURCE TYPE 4
            case 4
                while instance <= maxInstances
                    SYSTEM.R4(instance).STATE = false;
                    SYSTEM.R4(instance).MODE = uint8(1);
                    SYSTEM.R4(instance).CONTEXT_SWITCH_MAP = uint8([0 12 15 10; 5 0 7 5; 8 5 0 12; 11 14 12 0]);
                    % RULE_SET
                    % A1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 1;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 2;
                    ruleSet_row = ruleSet_row + 2;
                    % B1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 4;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 5;
                    ruleSet_row = ruleSet_row + 2;
                    % B2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 5;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 6;
                    ruleSet_row = ruleSet_row + 2;
                    % C2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 8;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 9;
                    ruleSet_row = ruleSet_row + 2;
                    % INCREMENTS
                    instance = instance + 1;
                    resourceCode = resourceCode + 1;
                end
                % RESOURCE TYPE 5
            case 5
                while instance <= maxInstances
                    SYSTEM.R5(instance).STATE = false;
                    SYSTEM.R5(instance).MODE = uint8(1);
                    SYSTEM.R5(instance).CONTEXT_SWITCH_MAP = uint8([0 15 10; 4 0 5; 17 8 0]);
                    % RULE_SET
                    % B1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 4;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 5;
                    ruleSet_row = ruleSet_row + 2;
                    % B2 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 5;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 6;
                    ruleSet_row = ruleSet_row + 2;
                    % C1 TYPE
                    SYSTEM.RULE_SET(ruleSet_row, 1) = 7;
                    SYSTEM.RULE_SET(ruleSet_row, 2) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 1) = resourceCode;
                    SYSTEM.RULE_SET(ruleSet_row + 1, 2) = 8;
                    ruleSet_row = ruleSet_row + 2;
                    % INCREMENTS
                    instance = instance + 1;
                    resourceCode = resourceCode + 1;
                end
        end
    end
    index = index + 1;
end
