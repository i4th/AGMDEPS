%% PLOT_permutationData

% LOAD DATA
load('ANALYSIS.mat');
load('RESULTS.mat');

% POPULATION SIZE
POPULATION_SIZE = 400;

% DECIDE WHICH PLOT YOUR DOING
TYPE = 3;   % 3, 4, 5, 6
while TYPE <= 6

switch TYPE
    case 3
        INDEX = ANALYSIS.TYPE3.INDEX_LOW_MAKE;
        faceColour = [0 0 1];
        PERM_1 = num2str(ANALYSIS.TYPE3.PERMUTA_LOW_MAKE);
        %PERM_1 = '[' + PERM_1 + ']';
    case 4
        INDEX = ANALYSIS.TYPE4.INDEX_LOW_MAKE;
        faceColour = [0.333 0 0.666];
        PERM_2 = num2str(ANALYSIS.TYPE4.PERMUTA_LOW_MAKE);
        %PERM_2 = '[' + PERM_2 + ']';
    case 5
        INDEX = ANALYSIS.TYPE5.INDEX_LOW_MAKE;
        faceColour = [0.666 0 0.333];
        PERM_3 = num2str(ANALYSIS.TYPE5.PERMUTA_LOW_MAKE);
        %PERM_3 = '[' + PERM_3 + ']';
    case 6
        INDEX = ANALYSIS.TYPE6.INDEX_LOW_MAKE;
        faceColour = [1 0 0];
        PERM_4 = num2str(ANALYSIS.TYPE6.PERMUTA_LOW_MAKE);
        %PERM_4 = '[' + PERM_4 + ']';
end

% PULL UP DATA
POPULATION = UNIVERSE(INDEX).POPULATION;

% PREALLOCATION OF OBJECTS
x = zeros(POPULATION_SIZE, 1, 'double');
y = zeros(POPULATION_SIZE, 1, 'double');
z = zeros(POPULATION_SIZE, 1, 'double');

i = 1;
while i <= POPULATION_SIZE
    x(i) = POPULATION(i).TOTAL_MAKESPAN_TIME;
    y(i) = POPULATION(i).TOTAL_PROCESSING_TIME;
    z(i) = POPULATION(i).TOTAL_CON_SWIT_TIME;
    % INCREMENT
    i = i + 1;
end

% LINEAR REGRESSION
b1 = x\y;
yCalc1 = b1*x;
switch TYPE
    case 3
        gradient_3 = b1;
    case 4
        gradient_4 = b1;
    case 5
        gradient_5 = b1;
    case 6
        gradient_6 = b1;
end
plot(x,yCalc1,':','LineWidth',2,'Color',faceColour);
hold on 

% PLOT
scatter(x,y,...
    60, ...
    'MarkerEdgeColor',[0 0 0], ...
    'MarkerFaceColor',faceColour,...
    'LineWidth',1);
hold on

% ITERATE TYPE
TYPE = TYPE + 1;
end

% TITLES & LABELS
title('PLOT OF CONFIGURATION POPULATIONS & LINEAR REGRESSION')
ylabel('INDIVIDUAL PROCESSING TIME');
xlabel('INDIVIDUAL MAKESPAN TIME');
legend('LINEAR FIT (3)',PERM_1,...
    'LINEAR FIT (4)',PERM_2,...
    'LINEAR FIT (5)',PERM_3,...
    'LINEAR FIT (6)',PERM_4);

% OTHER
grid on
grid minor
ylim([200000 221000]);
xlim([32000 85000]);
hold off
