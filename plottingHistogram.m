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


% TITLES & LABELS
title('PLOT OF POPULATION & LINEAR REGRESSION')
ylabel('TOTAL PROCESSING TIME');
xlabel('MAKESPAN');
legend('POPULATION','LINEAR FIT');





% BAR PLOT HIGH RESOLUTION MAKESPAN
%
% x needs to be between 4 and 7.5 (these are the makespan catergories
makespan_container = x;
x = 43000:100:51000;
% y needs to be the number of instances of that search (i.e. 1000 in total)
y = zeros(1,81);


x_index = 1;
i = 1;
while i <= 10000
    if (makespan_container(i) >= x(x_index)) && (makespan_container(i) < x(x_index+1))
        y(x_index) = y(x_index) + 1;
        i = i + 1;
        x_index = 1;
    else
        x_index = x_index + 1;
    end
end

% BAR PLOT
bar(x,y,'FaceColor',[0.4940 0.1840 0.5560]);
hold on

% MEAN LINE
% Y is the MEAN_PROCTIME
MEAN_MAKESPAN = load('MEAN_MAKESPAN.mat');
xMEAN = zeros(1,600);
z = 1;
while z <= 600
    xMEAN(z) = MEAN_MAKESPAN.MEAN_MAKESPAN;
    z = z + 1;
end
yMEAN = 0:1:599; 
plot(xMEAN,yMEAN,'LineWidth',2,'Color',[0 0 0]);
hold on

% STANDARD DEVIATION LINES
STD_MAKESPAN = load('STD_MAKESPAN.mat');
% LOWER STD OVER MEAN
LOWER_STD = MEAN_MAKESPAN.MEAN_MAKESPAN - STD_MAKESPAN.STD_MAKESPAN;
xL_STD = zeros(1,600);
n = 1;
while n <= 600
    xL_STD(n) = LOWER_STD;
    n = n + 1;
end
ySTD = 0:1:599; 
plot(xL_STD,ySTD,'LineWidth',2,'Color',[0 1 0]);
hold on
% HIGHER STD OVER MEAN
HIGHER_STD = MEAN_MAKESPAN.MEAN_MAKESPAN + STD_MAKESPAN.STD_MAKESPAN;
xH_STD = zeros(1,600);
m = 1;
while m <= 600
    xH_STD(m) = HIGHER_STD;
    m = m + 1;
end 
plot(xH_STD,ySTD,'LineWidth',2,'Color',[1 0 0]);
hold on

% GAUSSIAN
f = fit(x.',y.','gauss1');
plot(f,x,y);
hold off

% OTHER STUFF
grid minor
grid on
%
xlabel('MAKESPAN');
ylabel('INSTANCES (OF 10000)');
%
xlim([43000 51000]);

% TITLES & LABELS
%title('PLOT OF POPULATION & LINEAR REGRESSION')
legend('MAKESPAN. FREQ.',...
    'MEAN = 4.6257e+04',...
    'MEAN-STD = 4.5425e+04',...
    'MEAN+STD = 4.7089e+04',...
    'MAX. FREQ.',...
    'FREQ. GAUSS. FIT');