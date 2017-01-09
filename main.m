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

end

function initControls( controls )
    set(controls.yearControl, 'String', 1900);
    set(controls.monthControl, 'String', 1);
    set(controls.dayControl, 'String', 1);
    set(controls.speedControl, 'Value', 1);
end

function initVisualization( container )
    ax = subplot(1, 1, 1, 'Parent', container);
    plot3(ax, 0, 0, 0, 'o', 'Color', 'red');
    legend('Red circle', 'Location','southeast');
    grid('on');
end
