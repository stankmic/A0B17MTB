function main()
    clc; clear; close all;
    
    %% Create main figure
    mainFigure = createMainFigure();

    %% Add menu and controls
    menuToolbar = addMenu(mainFigure);
    controlsContainer = addControls(mainFigure);
    initControls(controlsContainer.UserData);

    %% Add 3D axes to plot planets in later
    visualizationContainer = addVisualizationContainer(mainFigure);
    initVisualization(visualizationContainer);

    %% Load planets from source file
    % TODO

    %% Start planets animation
    % TODO
end

function initControls( controls )
    set(controls.yearControl, 'String', 1900);
    set(controls.monthControl, 'String', 1);
    set(controls.dayControl, 'String', 1);
    set(controls.speedControl, 'Value', 1);
end

function initVisualization( container )
    ax = subplot(1, 1, 1, 'Parent', container);
    grid(ax, 'on');
    view(ax, 3);
    container.UserData.plot = animatedline(ax, 'Marker', 'o', 'Color', 'red');
    addpoints(container.UserData.plot, 0, 0, 0);
    drawnow();
    %hold on;
    %container.UserData.plotX = plot3(ax, 1, 2, 3, 'o', 'Color', 'blue');
    %hold off;
    legend('Red circle', 'Location', 'southeast');
end
