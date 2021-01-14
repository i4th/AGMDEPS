%                   T H O M A S   J.   H E L L I W E L L ' S
%           _    _ _______ ____  _   _  ____  __  __  ____  _    _  _____
%      /\  | |  | |__   __/ __ \| \ | |/ __ \|  \/  |/ __ \| |  | |/ ____|
%     /  \ | |  | |  | | | |  | |  \| | |  | | \  / | |  | | |  | | (___
%    / /\ \| |  | |  | | | |  | | . ` | |  | | |\/| | |  | | |  | |\___ \
%   / ____ \ |__| |  | | | |__| | |\  | |__| | |  | | |__| | |__| |____) |
%  /_/    \_\____/   |_|  \____/|_| \_|\____/|_|  |_|\____/ \____/|_____/
%    D I S C R E T E - E V E N T   M O D E L   C O N S T R U C T I O N

% POPULATION SIZE
POPULATION_SIZE = uint32(400);

% SPECIFY PERMUTATION
load('UNIVERSE.mat');

%% MAIN LOOP
universeInstance = 1;

tic
while universeInstance <= 221
    
    % TOTAL RESOURCES
    UNIVERSE(universeInstance).TOTAL_RESOURCES = UNIVERSE(universeInstance).PERMUTATION(1) ...
        + UNIVERSE(universeInstance).PERMUTATION(2) ...
        + UNIVERSE(universeInstance).PERMUTATION(3) ...
        + UNIVERSE(universeInstance).PERMUTATION(4) ...
        + UNIVERSE(universeInstance).PERMUTATION(5);
    
    % PULL UP PERMUTATION
    SYS_PERMUTATION = UNIVERSE(universeInstance).PERMUTATION;
    
    %% BUILD SYSTEM & POPULATION
    
    % BUILD SYSTEM
    % DEBUGGER
    disp("UNIVERSE (PERMUTATION INDEX): " + universeInstance);
    [ INITAL_SYSTEM ] = buildSystem(SYS_PERMUTATION);
    
    % DISCOVER NEIGHBOURHOOD
    [INITAL_SYSTEM] = discoverNeighbourhood(INITAL_SYSTEM);
    
    % BUILD POPULATION
    [ POPULATION ] = buildPopulation(POPULATION_SIZE);
    
    %% RUN MODEL
    
    INDIVIDUAL = 1;
    BEST_MAKESPAN = uint32(100000);
    
    parfor INDIVIDUAL = 1:POPULATION_SIZE
        % SAVE INITAL STATE OF SYSTEM
        SYSTEM = INITAL_SYSTEM;
        
        % RUN MODEL/SIMULATION INSTANCE
        [ TOTAL_PROCESSING_TIME, TOTAL_MAKESPAN_TIME, TOTAL_CON_SWIT_TIME, VOLUMES_A, VOLUMES_B, VOLUMES_C ] = runModel(SYSTEM);
        
        % RECORD
        POPULATION(INDIVIDUAL).TOTAL_PROCESSING_TIME = TOTAL_PROCESSING_TIME;
        POPULATION(INDIVIDUAL).TOTAL_MAKESPAN_TIME = TOTAL_MAKESPAN_TIME;
        POPULATION(INDIVIDUAL).TOTAL_CON_SWIT_TIME = TOTAL_CON_SWIT_TIME;
        %
        POPULATION(INDIVIDUAL).A_VOLUMES = VOLUMES_A;
        POPULATION(INDIVIDUAL).B_VOLUMES = VOLUMES_B;
        POPULATION(INDIVIDUAL).C_VOLUMES = VOLUMES_C;
        
        % DEBUGGER
        disp("COMPLETED UNIVERSE:INDIVIDUAL - " + universeInstance + ":" + INDIVIDUAL);
        
    end
    
    % SAVE IN UNIVERSE
    UNIVERSE(universeInstance).POPULATION = POPULATION;
    UNIVERSE(universeInstance).BEST_MAKESPAN_TIME = bestMakespan(POPULATION, POPULATION_SIZE);
    UNIVERSE(universeInstance).MEAN_MAKESPAN = calculateMakespanMean(POPULATION, POPULATION_SIZE);
    UNIVERSE(universeInstance).MEAN_PROCESSING = calculateProcessingMean(POPULATION, POPULATION_SIZE);
    UNIVERSE(universeInstance).STD_MAKESPAN = calculateMakespanSTD(POPULATION, POPULATION_SIZE);
    UNIVERSE(universeInstance).STD_PROCESSING = calculateProcessingSTD(POPULATION, POPULATION_SIZE);
    
    
    %
    time = toc;
    disp("DONE UNIVERSE: " + universeInstance + " IN TIME: " + time);
    
    % INCREMENT UNIVERSE INSTANCE UP TO 221
    universeInstance = universeInstance + 1;
end

disp("________________");
disp("COMPLETED SEARCH");
disp("SAVING...       ");
save('RESULTS.mat', 'UNIVERSE')
disp("SAVED.          ");

%% BEST MAKESPAN
function [ BEST ] = bestMakespan(POPULATION, POPULATION_SIZE)
BEST = uint32(100000);
s = 1;
while s <= POPULATION_SIZE
    if POPULATION(s).TOTAL_MAKESPAN_TIME < BEST
        BEST = POPULATION(s).TOTAL_MAKESPAN_TIME;
    end
    % ITERATIVE
    s = s + 1;
end
disp("BEST MAKESPAN OF UNIVERSE: " + BEST);
end
%% MAKESPAN MEAN
function [ MEAN ] = calculateMakespanMean(POPULATION, POPULATION_SIZE)
CONTAINER = zeros(POPULATION_SIZE, 1);
l = 1;
while l <= POPULATION_SIZE
    CONTAINER(l) = POPULATION(l).TOTAL_MAKESPAN_TIME;
    l = l + 1;
end
MEAN = mean(CONTAINER);
end
%% MAKESPAN STD
function [ STD ] = calculateMakespanSTD(POPULATION, POPULATION_SIZE)
CONTAINER = zeros(POPULATION_SIZE, 1);
p = 1;
while p <= POPULATION_SIZE
    CONTAINER(p) = POPULATION(p).TOTAL_MAKESPAN_TIME;
    p = p + 1;
end
STD = std(CONTAINER);
end
%% PROCESSING MEAN
function [ MEAN ] = calculateProcessingMean(POPULATION, POPULATION_SIZE)
CONTAINER = zeros(POPULATION_SIZE, 1);
l = 1;
while l <= POPULATION_SIZE
    CONTAINER(l) = POPULATION(l).TOTAL_PROCESSING_TIME;
    l = l + 1;
end
MEAN = mean(CONTAINER);
end
%% PROCESING STD
function [ STD ] = calculateProcessingSTD(POPULATION, POPULATION_SIZE)
CONTAINER = zeros(POPULATION_SIZE, 1);
p = 1;
while p <= POPULATION_SIZE
    CONTAINER(p) = POPULATION(p).TOTAL_PROCESSING_TIME;
    p = p + 1;
end
STD = std(CONTAINER);
end
