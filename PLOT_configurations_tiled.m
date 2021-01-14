


%% PLOT CONFIGURATIONS ON ONE PLOT

% LOAD DATA
load('RESULTS.mat');
load('ANALYSIS.mat');

% DEFINE THE TILED LAYOUT
t = tiledlayout(2,2,'TileSpacing','Compact');

%% TILE 1 -  3 PROCESSORS
nexttile
i = 1;
while i <= 221
    % PLOT INSTANCE
    if UNIVERSE(i).TOTAL_RESOURCES == 3
        
        % STD BARS
        STD_HORI = UNIVERSE(i).STD_MAKESPAN;
        e = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_HORI,'horizontal',...
            'LineWidth', 1);
        e.Color = 'k';
        STD_VERT = UNIVERSE(i).STD_PROCESSING;
        d = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_VERT, ...
            'LineWidth', 1);
        d.Color = 'k';
        
        % DATA POINTS
        scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
            UNIVERSE(i).MEAN_PROCESSING, ...
            60, ...
            'MarkerEdgeColor',[0 0 0], ...
            'MarkerFaceColor',[0 0 1],...
            'LineWidth',1);
        
        % IF ITS THE LOWEST MAKESPAN
        if i == ANALYSIS.TYPE3.INDEX_LOW_MAKE
            scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
                UNIVERSE(i).MEAN_PROCESSING, ...
                10, ...
                'MarkerEdgeColor',[0 0 0], ...
                'MarkerFaceColor',[0 0 0]);
        end
    end
    hold on
    
    % ITERATE
    i = i + 1;
end

% OTHER
title('3 PROCESSORS')
ylabel('MEAN PROCESSING TIME');
xlabel('MEAN MAKESPAN TIME');
grid on
grid minor
ylim([195000 282000]);
xlim([30000 100000]);

%% TILE 2 -  4 PROCESSORS
nexttile
i = 1;
while i <= 221
    % PLOT INSTANCE
    if UNIVERSE(i).TOTAL_RESOURCES == 4
        
        % STD BARS
        STD_HORI = UNIVERSE(i).STD_MAKESPAN;
        e = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_HORI,'horizontal',...
            'LineWidth', 1);
        e.Color = 'k';
        STD_VERT = UNIVERSE(i).STD_PROCESSING;
        d = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_VERT, ...
            'LineWidth', 1);
        d.Color = 'k';
        
        % DATA POINT
        scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
            UNIVERSE(i).MEAN_PROCESSING, ...
            60, ...
            'MarkerEdgeColor',[0 0 0], ...
            'MarkerFaceColor',[0.333 0 0.666],...
            'LineWidth',1);
        
        
        % IF ITS THE LOWEST MAKESPAN
        if i == ANALYSIS.TYPE4.INDEX_LOW_MAKE
            scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
                UNIVERSE(i).MEAN_PROCESSING, ...
                10, ...
                'MarkerEdgeColor',[0 0 0], ...
                'MarkerFaceColor',[0 0 0]);
        end
        
    end
    hold on
    
    % ITERATE
    i = i + 1;
end

% OTHER
title('4 PROCESSORS')
ylabel('MEAN PROCESSING TIME');
xlabel('MEAN MAKESPAN TIME');
grid on
grid minor
ylim([195000 282000]);
xlim([30000 100000]);

%% TILE 3 -  5 PROCESSORS
nexttile
i = 1;
while i <= 221
    % PLOT INSTANCE
    if UNIVERSE(i).TOTAL_RESOURCES == 5
        
        % STD BARS
        STD_HORI = UNIVERSE(i).STD_MAKESPAN;
        e = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_HORI,'horizontal',...
            'LineWidth', 1);
        e.Color = 'k';
        STD_VERT = UNIVERSE(i).STD_PROCESSING;
        d = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_VERT, ...
            'LineWidth', 1);
        d.Color = 'k';
        
        % DATA POINT
        scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
            UNIVERSE(i).MEAN_PROCESSING, ...
            60, ...
            'MarkerEdgeColor',[0 0 0], ...
            'MarkerFaceColor',[0.666 0 0.333],...
            'LineWidth',1);
        
        % IF ITS THE LOWEST MAKESPAN
        if i == ANALYSIS.TYPE5.INDEX_LOW_MAKE
            scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
                UNIVERSE(i).MEAN_PROCESSING, ...
                10, ...
                'MarkerEdgeColor',[0 0 0], ...
                'MarkerFaceColor',[0 0 0]);
        end
    end
    hold on
    
    % ITERATE
    i = i + 1;
end

% OTHER
title('5 PROCESSORS')
ylabel('MEAN PROCESSING TIME');
xlabel('MEAN MAKESPAN TIME');
grid on
grid minor
ylim([195000 282000]);
xlim([30000 100000]);

%% TILE 4 -  6 PROCESSORS
nexttile
i = 1;
while i <= 221
    % PLOT INSTANCE
    if UNIVERSE(i).TOTAL_RESOURCES == 6
        
        % STD BARS
        STD_HORI = UNIVERSE(i).STD_MAKESPAN;
        e = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_HORI,'horizontal',...
            'LineWidth', 1);
        e.Color = 'k';
        STD_VERT = UNIVERSE(i).STD_PROCESSING;
        d = errorbar(UNIVERSE(i).MEAN_MAKESPAN,UNIVERSE(i).MEAN_PROCESSING,STD_VERT, ...
            'LineWidth', 1);
        d.Color = 'k';
        
        % DATA POINT
        scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
            UNIVERSE(i).MEAN_PROCESSING, ...
            60, ...
            'MarkerEdgeColor',[0 0 0], ...
            'MarkerFaceColor',[1 0 0],...
            'LineWidth',1);
        
        % IF ITS THE LOWEST MAKESPAN
        if i == ANALYSIS.TYPE6.INDEX_LOW_MAKE
            scatter(UNIVERSE(i).MEAN_MAKESPAN, ...
                UNIVERSE(i).MEAN_PROCESSING, ...
                10, ...
                'MarkerEdgeColor',[0 0 0], ...
                'MarkerFaceColor',[0 0 0]);
        end
    end
    hold on
    
    % ITERATE
    i = i + 1;
end

% OTHER
title('6 PROCESSORS')
ylabel('MEAN PROCESSING TIME');
xlabel('MEAN MAKESPAN TIME');
grid on
grid minor
ylim([195000 282000]);
xlim([30000 100000])

set(gcf,'renderer','painters');
set(gcf,'Position',[0 0 960 1080])
