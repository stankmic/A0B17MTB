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
    planetData.name = 'Země';
    planetData.color = 'blue';
    planetData.a = 1.00000261;
    planetData.e = 0.01671123;
    planetData.i = -0.00001531;
    planetData.L = 100.46457166;
    planetData.Ldot = 35999.37244981;
    planetData.omegaDash = 102.93768193;
    planetData.Omega = 0;
    addPlanetTimer(mainFigure, planetData, 1 );
    drawnow();
    start(mainFigure.UserData.planetTimers);
    % TODO
    % for each planet add timer, to recalculate position

end
