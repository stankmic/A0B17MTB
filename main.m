function main()
    clc; clear; close all;
    
    %% Create main figure
    mainFigure = createMainFigure();

    %% Add menu and controls
    addControls(mainFigure);

    %% Add 3D axes to plot planets in later
    addVisualizationContainer(mainFigure);

    %% Initial window size
    resizeWindowCallback(mainFigure);

    %% Load planets from source file to cell or struct array
    % TODO
    % for each planet add animatedline
    % store info necessary for further calculation into UserData

    %% Start planets animation
    startTimeTimer(mainFigure);
    planetData.name = 'Sun';
    addPlanetTimer(mainFigure, planetData, 1 );
    drawnow();
    start(mainFigure.UserData.planetTimers);
    % TODO
    % for each planet add timer, to recalculate position

end
