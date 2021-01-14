% notepad3




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
        70, ...
        'MarkerEdgeColor',[0 0 0], ...
        'MarkerFaceColor',instanceColour,...
        'LineWidth',1);
    hold on
    
    % ITERATE TO NEW INSTANCE
    i = i + 1;
    
end

% RELEASE
hold off

% TITLES & LABELS
title('MEAN POPULATION VALUES FOR EACH CONFIGURATION')
ylabel('MEAN PROCESSING');
xlabel('MEAN MAKESPAN');

% OTHER 
grid on
grid minor 
ylim([195000 280000]);




x=[0.5,1.0,1.2];
y=[3.8083E-11,3.3634E-11,4.2001E-10];


% VERTICAL ERROR BARS
STD_VERT = [8.4924E-11  7.5113E-11  9.3915E-10];
errorbar(x,y,STD_VERT, 'bp')
hold on
% HORIZONTAL ERROR BARS
STD_HORI = [0.01  0.01  0.01];
errorbar(x,y,STD_HORI,'horizontal')

% LIMITS
xlim([0.25 1.5])
ylim([-1E-9 1E-9])

