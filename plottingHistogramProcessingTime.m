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
    y(i) = POPULATION.POPULATION(i).TOTAL_MAKESPAN_TIME;
    x(i) = POPULATION.POPULATION(i).TOTAL_PROCESSING_TIME;
    z(i) = POPULATION.POPULATION(i).TOTAL_CON_SWIT_TIME;
    % INCREMENT
    i = i + 1;
end


% BAR PLOT HIGH RESOLUTION MAKESPAN

% x needs to be between 4 and 7.5 (these are the makespan catergories
processing_container = x;
x = 194000:250:208000;
% y needs to be the number of instances of that search (i.e. 1000 in total)
y = zeros(1,57);

clear i
x_index = 1;
i = 1;
while i <= 10000
    if (processing_container(i) >= x(x_index)) && (processing_container(i) < x(x_index+1))
        y(x_index) = y(x_index) + 1;
        i = i + 1;
        x_index = 1;
    else
        x_index = x_index + 1;
    end
end

% BAR PLOT
bar(x,y)
hold on

% MEAN LINE
% Y is the MEAN_PROCTIME
MEAN_PROCTIME = load('MEAN_PROCTIME.mat');
xMEAN = zeros(1,700);
z = 1;
while z <= 700
    xMEAN(z) = MEAN_PROCTIME.MEAN_PROCTIME;
    z = z + 1;
end
yMEAN = 0:1:699; 
plot(xMEAN,yMEAN,'LineWidth',2,'Color',[0 0 0]);
hold on

% STANDARD DEVIATION LINES
STD_PROCTIME = load('STD_PROCTIME.mat');
% LOWER STD OVER MEAN
LOWER_STD = MEAN_PROCTIME.MEAN_PROCTIME - STD_PROCTIME.STD_PROCTIME;
xL_STD = zeros(1,700);
n = 1;
while n <= 700
    xL_STD(n) = LOWER_STD;
    n = n + 1;
end
ySTD = 0:1:699; 
plot(xL_STD,ySTD,'LineWidth',2,'Color',[0 1 0]);
hold on
% HIGHER STD OVER MEAN
HIGHER_STD = MEAN_PROCTIME.MEAN_PROCTIME + STD_PROCTIME.STD_PROCTIME;
xH_STD = zeros(1,700);
m = 1;
while m <= 700
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
xlabel('PROCESSING TIME');
ylabel('INSTANCES (OF 10000)');
%
xlim([194000 208000]);

% TITLES & LABELS
%title('PLOT OF POPULATION & LINEAR REGRESSION')
legend('PROC. TIME. FREQ.',...
    'MEAN = 2.008e+05',...
    'MEAN-STD = 1.9917e+05',...
    'MEAN+STD = 2.0243e+05',...
    'MAX. FREQ.',...
    'FREQ. GAUSS. FIT');
