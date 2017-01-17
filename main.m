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
    planetsData = getPlanetsData();

    %% Sun
    sun = animatedline('Marker', '*', 'Color', 'red');
    addpoints(sun, 0, 0, 0);

    %% Start planets animation
    startTimeTimer(mainFigure);
    for k=1:numel(planetsData)
        addPlanetTimer(mainFigure, planetsData(k), k);
    end
    drawnow();
    start(mainFigure.UserData.planetTimers);

end

function [ planetsData ] = getPlanetsData()
    loaded = load('planetsData.mat', 'planetsData');
    planetsData = loaded.planetsData;
end
