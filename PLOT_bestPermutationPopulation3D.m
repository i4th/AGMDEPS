




%% PLOTTING HIGHEST PERFORMING 3D


% POPULATION SIZE
POPULATION_SIZE = 400;


% LOAD DATA
load('ANALYSIS.mat');
load('RESULTS.mat');
INDEX = ANALYSIS.TYPE6.INDEX_LOW_MAKE;
POPULATION = UNIVERSE(INDEX).POPULATION;
% PREALLOCATION OF OBJECTS
x = zeros(POPULATION_SIZE, 1, 'uint32');
y = zeros(POPULATION_SIZE, 1, 'uint32');
z = zeros(POPULATION_SIZE, 1, 'uint32');

i = 1;
while i <= POPULATION_SIZE
	x(i) = POPULATION(i).TOTAL_MAKESPAN_TIME;
	y(i) = POPULATION(i).TOTAL_PROCESSING_TIME;
    z(i) = POPULATION(i).TOTAL_CON_SWIT_TIME;
    % INCREMENT
    i = i + 1;
end

% PLOT
s = scatter3(x,y,z);
s.SizeData = 60;
s.MarkerEdgeColor = [0 0 0];
s.LineWidth = 1;

colormap(gcf,hot)
colorbar
view(40,35)

title('3D PLOT OF POPULATION')

xlabel('TOTAL PROCESSING TIME');
ylabel('TOTAL MAKESPAN TIME');
zlabel('CONTEXT SWITCHING TIME');
