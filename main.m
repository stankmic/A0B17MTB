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
    planetData.name = 'Saturn';
    planetData.a = 9.56423;
    planetData.M0 = 23.345;
    planetData.e = 0.05566;
    planetData.omegaDash = 94.280;
    planetData.i = 2.4865;
    planetData.Omega = 113.625;
    planetData.n = 0.033327;
    addPlanetTimer(mainFigure, planetData, 1 );
    drawnow();
    start(mainFigure.UserData.planetTimers);
    % TODO
    % for each planet add timer, to recalculate position

end
