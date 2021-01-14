%% PLOTTING

% POPULATION SIZE
POPULATION_SIZE = 10000;

% LOAD DATA
POPULATION = load('POPULATION.mat');

% PREALLOCATION OF OBJECTS
x = zeros(POPULATION_SIZE, 1, 'double');
y = zeros(POPULATION_SIZE, 1, 'double');
z = zeros(POPULATION_SIZE, 1, 'double');

i = 1;
while i <= POPULATION_SIZE
    x(i) = POPULATION.POPULATION(i).TOTAL_MAKESPAN_TIME;
	y(i) = POPULATION.POPULATION(i).TOTAL_PROCESSING_TIME;
    z(i) = POPULATION.POPULATION(i).TOTAL_CON_SWIT_TIME;
    % INCREMENT
    i = i + 1;
end

% PLOT
scatter(x,y,[],z,'filled');
hold on

% MEAN
MEAN_MAKESPAN = mean(x);
MEAN_PROCTIME = mean(y);
save('MEAN_MAKESPAN.mat','MEAN_MAKESPAN');
save('MEAN_PROCTIME.mat','MEAN_PROCTIME');
STD_MAKESPAN = std(x);
STD_PROCTIME = std(y);
save('STD_MAKESPAN.mat','STD_MAKESPAN');
save('STD_PROCTIME.mat','STD_PROCTIME');

% LINEAR REGRESSION
b1 = x\y;
yCalc1 = b1*x;
plot(x,yCalc1,'LineWidth',2,'Color',[1,0,0]);

% TITLES & LABELS
title('PLOT OF POPULATION & LINEAR REGRESSION')
ylabel('TOTAL PROCESSING TIME');
xlabel('MAKESPAN');
legend('POPULATION','LINEAR FIT');

% OTHER 
grid on
grid minor 
ylim([194000 208000]);

