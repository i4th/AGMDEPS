load('RESULTS.mat');

% TOTAL RESOURCES 3 OBJECT
% CONFIG EFFICIENCY
ANALYSIS.TYPE3.HIGHEST_CONFIG_EFF = 0;
ANALYSIS.TYPE3.PERMUTA_CONFIG_EFF = [0 0 0 0 0];
ANALYSIS.TYPE3.INDEX_CONFIG_EFF = 1;
% MAKESPAN
ANALYSIS.TYPE3.LOWEST_MAKESPAN = 100000;
ANALYSIS.TYPE3.PERMUTA_LOW_MAKE = [0 0 0 0 0];
ANALYSIS.TYPE3.INDEX_LOW_MAKE = 1;

% TOTAL RESOURCES 4 OBJECT
% CONFIG EFFICIENCY
ANALYSIS.TYPE4.HIGHEST_CONFIG_EFF = 0;
ANALYSIS.TYPE4.PERMUTA_CONFIG_EFF = [0 0 0 0 0];
ANALYSIS.TYPE4.INDEX_CONFIG_EFF = 1;
% MAKESPAN
ANALYSIS.TYPE4.LOWEST_MAKESPAN = 100000;
ANALYSIS.TYPE4.PERMUTA_LOW_MAKE = [0 0 0 0 0];
ANALYSIS.TYPE4.INDEX_LOW_MAKE = 1;

% TOTAL RESOURCES 5 OBJECT
% CONFIG EFFICIENCY
ANALYSIS.TYPE5.HIGHEST_CONFIG_EFF = 0;
ANALYSIS.TYPE5.PERMUTA_CONFIG_EFF = [0 0 0 0 0];
ANALYSIS.TYPE5.INDEX_CONFIG_EFF = 1;
% MAKESPAN
ANALYSIS.TYPE5.LOWEST_MAKESPAN = 100000;
ANALYSIS.TYPE5.PERMUTA_LOW_MAKE = [0 0 0 0 0];
ANALYSIS.TYPE5.INDEX_LOW_MAKE = 1;

% TOTAL RESOURCES 6 OBJECT
% CONFIG EFFICIENCY
ANALYSIS.TYPE6.HIGHEST_CONFIG_EFF = 0;
ANALYSIS.TYPE6.PERMUTA_CONFIG_EFF = [0 0 0 0 0];
ANALYSIS.TYPE6.INDEX_CONFIG_EFF = 1;
% MAKESPAN
ANALYSIS.TYPE6.LOWEST_MAKESPAN = 100000;
ANALYSIS.TYPE6.PERMUTA_LOW_MAKE = [0 0 0 0 0];
ANALYSIS.TYPE6.INDEX_LOW_MAKE = 1;

j = 1;
while j <= 221
    UNIVERSE(j).CONFIG_EFFICENCY = UNIVERSE(j).MEAN_PROCESSING/UNIVERSE(j).MEAN_MAKESPAN;
    
    switch UNIVERSE(j).TOTAL_RESOURCES
        case 3
            % WITH TOTAL OF 3 RESOURCES
            if UNIVERSE(j).CONFIG_EFFICENCY > ANALYSIS.TYPE3.HIGHEST_CONFIG_EFF
                ANALYSIS.TYPE3.HIGHEST_CONFIG_EFF = UNIVERSE(j).CONFIG_EFFICENCY;
                ANALYSIS.TYPE3.PERMUTA_CONFIG_EFF = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE3.INDEX_CONFIG_EFF = j;
            end
            if UNIVERSE(j).MEAN_MAKESPAN < ANALYSIS.TYPE3.LOWEST_MAKESPAN
                ANALYSIS.TYPE3.LOWEST_MAKESPAN = UNIVERSE(j).MEAN_MAKESPAN; 
                ANALYSIS.TYPE3.PERMUTA_LOW_MAKE = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE3.INDEX_LOW_MAKE = j;
            end
        case 4
            % WITH TOTAL OF 4 RESOURCES
            if UNIVERSE(j).CONFIG_EFFICENCY > ANALYSIS.TYPE4.HIGHEST_CONFIG_EFF
                ANALYSIS.TYPE4.HIGHEST_CONFIG_EFF = UNIVERSE(j).CONFIG_EFFICENCY;
                ANALYSIS.TYPE4.PERMUTA_CONFIG_EFF = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE4.INDEX_CONFIG_EFF = j;
            end
            if UNIVERSE(j).MEAN_MAKESPAN < ANALYSIS.TYPE4.LOWEST_MAKESPAN
                ANALYSIS.TYPE4.LOWEST_MAKESPAN = UNIVERSE(j).MEAN_MAKESPAN ;
                ANALYSIS.TYPE4.PERMUTA_LOW_MAKE = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE4.INDEX_LOW_MAKE = j;
            end
        case 5
            % WITH TOTAL OF 4 RESOURCES
            if UNIVERSE(j).CONFIG_EFFICENCY > ANALYSIS.TYPE5.HIGHEST_CONFIG_EFF
                ANALYSIS.TYPE5.HIGHEST_CONFIG_EFF = UNIVERSE(j).CONFIG_EFFICENCY;
                ANALYSIS.TYPE5.PERMUTA_CONFIG_EFF = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE5.INDEX_CONFIG_EFF = j;
            end
            if UNIVERSE(j).MEAN_MAKESPAN  < ANALYSIS.TYPE5.LOWEST_MAKESPAN
                ANALYSIS.TYPE5.LOWEST_MAKESPAN = UNIVERSE(j).MEAN_MAKESPAN ;
                ANALYSIS.TYPE5.PERMUTA_LOW_MAKE = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE5.INDEX_LOW_MAKE = j;
            end
        case 6
            % WITH TOTAL OF 4 RESOURCES
            if UNIVERSE(j).CONFIG_EFFICENCY > ANALYSIS.TYPE6.HIGHEST_CONFIG_EFF
                ANALYSIS.TYPE6.HIGHEST_CONFIG_EFF = UNIVERSE(j).CONFIG_EFFICENCY;
                ANALYSIS.TYPE6.PERMUTA_CONFIG_EFF = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE6.INDEX_CONFIG_EFF = j;
            end
            if UNIVERSE(j).MEAN_MAKESPAN  < ANALYSIS.TYPE6.LOWEST_MAKESPAN
                ANALYSIS.TYPE6.LOWEST_MAKESPAN = UNIVERSE(j).MEAN_MAKESPAN ;
                ANALYSIS.TYPE6.PERMUTA_LOW_MAKE = UNIVERSE(j).PERMUTATION;
                ANALYSIS.TYPE6.INDEX_LOW_MAKE = j;
            end
    end

    % ITERATE
    j = j + 1;
end
