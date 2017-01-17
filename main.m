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
    planetsData(1).name = 'Merkur';
    planetsData(1).color = 'black';
    planetsData(1).a = 0.38709927;
    planetsData(1).e = 0.20563593;
    planetsData(1).i = 7.00497902;
    planetsData(1).L = 252.25032350;
    planetsData(1).Ldot = 149472.67411175;
    planetsData(1).omegaDash = 77.45779628;
    planetsData(1).Omega = 48.33076593;
    planetsData(2).name = 'Venuše';
    planetsData(2).color = 'magenta';
    planetsData(2).a = 0.72333566;
    planetsData(2).e = 0.00677672;
    planetsData(2).i = 3.39467605;
    planetsData(2).L = 181.97909950;
    planetsData(2).Ldot = 58517.81538729;
    planetsData(2).omegaDash = 131.60246718;
    planetsData(2).Omega = 76.67984255;
    planetsData(3).name = 'Země';
    planetsData(3).color = 'blue';
    planetsData(3).a = 1.00000261;
    planetsData(3).e = 0.01671123;
    planetsData(3).i = -0.00001531;
    planetsData(3).L = 100.46457166;
    planetsData(3).Ldot = 35999.37244981;
    planetsData(3).omegaDash = 102.93768193;
    planetsData(3).Omega = 0;
    planetsData(4).name = 'Mars';
    planetsData(4).color = 'red';
    planetsData(4).a = 1.52371034;
    planetsData(4).e = 0.09339410;
    planetsData(4).i = 1.84969142;
    planetsData(4).L = -4.55343205;
    planetsData(4).Ldot = 19140.30268499;
    planetsData(4).omegaDash = -23.94362959;
    planetsData(4).Omega = 49.55953891;
    planetsData(5).name = 'Jupiter';
    planetsData(5).color = 'yellow';
    planetsData(5).a = 5.20288700;
    planetsData(5).e = 0.04838624;
    planetsData(5).i = 1.30439695;
    planetsData(5).L = 34.39644051;
    planetsData(5).Ldot = 3034.74612775;
    planetsData(5).omegaDash = 14.72847983;
    planetsData(5).Omega = 100.47390909;
    planetsData(6).name = 'Saturn';
    planetsData(6).color = 'green';
    planetsData(6).a = 9.53667594;
    planetsData(6).e = 0.05386179;
    planetsData(6).i = 2.48599187;
    planetsData(6).L = 49.95424423;
    planetsData(6).Ldot = 1222.49362201;
    planetsData(6).omegaDash = 92.59887831;
    planetsData(6).Omega = 113.66242448;
    planetsData(7).name = 'Uran';
    planetsData(7).color = 'white';
    planetsData(7).a = 19.18916464;
    planetsData(7).e = 0.04725744;
    planetsData(7).i = 0.77263783;
    planetsData(7).L = 313.23810451;
    planetsData(7).Ldot = 428.48202785;
    planetsData(7).omegaDash = 170.95427630;
    planetsData(7).Omega = 74.01692503;
    planetsData(8).name = 'Neptun';
    planetsData(8).color = 'cyan';
    planetsData(8).a = 30.06992276;
    planetsData(8).e = 0.00859048;
    planetsData(8).i = 1.77004347;
    planetsData(8).L = -55.12002969;
    planetsData(8).Ldot = 218.45945325;
    planetsData(8).omegaDash = 44.96476227;
    planetsData(8).Omega = 131.78422574;
end
