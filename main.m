function main()
    clc; clear; close all;
    
    %% Create main figure
    mainFigure = createMainFigure();

    %% Add menu and controls
    addMenu(mainFigure);
    addControls(mainFigure);
    initControls(mainFigure.UserData.controlsContainer.UserData);

    %% Add 3D axes to plot planets in later
    addVisualizationContainer(mainFigure);
    initVisualization(mainFigure.UserData.visualizationContainer);

    %% Initial window size
    resizeWindowCallback(mainFigure);

    %% Load planets from source file to cell or struct array
    % TODO
    % for each planet add animatedline
    % store info necessary for further calculation into UserData

    %% Start planets animation
    startTimeTimer(mainFigure);
    addPlanetTimer('Sun', NaN(0), mainFigure, 1 );
    start(mainFigure.UserData.planetTimers);
    % TODO
    % for each planet add timer, to recalculate position, or one time to
    % recalculate all positions at once

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
