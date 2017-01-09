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

    %% Load planets from source file

end

function initControls( controls )
    set(controls.yearControl, 'String', 1900);
    set(controls.monthControl, 'String', 1);
    set(controls.dayControl, 'String', 1);
    set(controls.speedControl, 'Value', 1);
end
