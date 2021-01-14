function [ POPULATION ] = buildPopulation(POPULATION_SIZE)

% START TIMER
tic

% OBJECT
i = 1;
while i <= POPULATION_SIZE
    
    % STRUCTURE
    POPULATION(i).TOTAL_PROCESSING_TIME = uint32(0);
    POPULATION(i).TOTAL_MAKESPAN_TIME = uint32(0);
    POPULATION(i).TOTAL_CON_SWIT_TIME = uint32(0);
    POPULATION(i).A_VOLUMES = uint32(zeros(1,3));
    POPULATION(i).B_VOLUMES = uint32(zeros(1,3));
    POPULATION(i).C_VOLUMES = uint32(zeros(1,3));
    
    % INCREMENT
    i = i + 1;
    
end

% END TIMER
population_build_time = toc;
disp("POPULATION BUILT IN: " + population_build_time + " SECONDS"); 
clear population_build_time

end