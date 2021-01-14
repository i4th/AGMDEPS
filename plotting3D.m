



%% PLOTTING 3D

% POPULATION SIZE
POPULATION_SIZE = 10000;

% LOAD DATA
POPULATION = load('POPULATION.mat');

% PREALLOCATION OF OBJECTS
x = zeros(POPULATION_SIZE, 1, 'uint32');
y = zeros(POPULATION_SIZE, 1, 'uint32');
z = zeros(POPULATION_SIZE, 1, 'uint32');

i = 1;
while i <= POPULATION_SIZE
	x(i) = POPULATION.POPULATION(i).TOTAL_PROCESSING_TIME;
    y(i) = POPULATION.POPULATION(i).TOTAL_MAKESPAN_TIME;
    z(i) = POPULATION.POPULATION(i).TOTAL_CON_SWIT_TIME;
    % INCREMENT
    i = i + 1;
end

% PLOT
scatter3(x,y,z);
view(40,35)

title('3D PLOT OF POPULATION')

xlabel('TOTAL PROCESSING TIME');
ylabel('MAKESPAN');
zlabel('CONTEXT SWITCHING TIME');
