


% PLOT CONFIGURATIONS ON ONE PLOT

load('RESULTS.mat');

i = 1;
while i <= 221
    
    % COLLECT COLOUR
    switch UNIVERSE(i).TOTAL_RESOURCES
        case 3
            % MOST BLUE
            instanceColour = [0 0 1];
        case 4
            %
            instanceColour = [0.333 0 0.666];
        case 5
            %
            instanceColour = [0.666 0 0.333];
        case 6
            % MOST RED
            instanceColour = [1 0 0];
    end    
    
    % EACH RECORD IN UNIVERSE/RESULTS PLOT
    scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
        UNIVERSE(i).MEAN_PROCESSING, ...
        120, ...
        'MarkerEdgeColor',[0 0 0], ...
        'MarkerFaceColor',instanceColour,...
        'LineWidth',1.5);
    hold on
    
    % ITERATE TO NEW INSTANCE
    i = i + 1;
    
end

% RELEASE
hold off

% TITLES & LABELS
title('MEAN POPULATION VALUES')
ylabel('MEAN PROCESSING TIME');
xlabel('MEAN MAKESPAN TIME');

% OTHER 
grid on
grid minor 
ylim([195000 282000]);
xlim([30000 100000]);

set(gcf,'renderer','painters');
set(gcf,'Position',[0 0 960 1080])
