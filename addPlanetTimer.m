function addPlanetTimer( mainFigure, planetData, arrayPos )
    % add animater line for the planet
    planetData.planetLine = addPlanetAnimatedLine(planetData);
    planetData.mainFigure = mainFigure;
    % create planet timer
    planetTimer = timer('Name', planetData.name, 'TimerFcn', @planetTimerFcn, 'UserData', planetData, 'ExecutionMode', 'fixedSpacing', 'Period', 1);
    % save planet timer to UserData
    mainFigure.UserData.planetTimers(arrayPos) = planetTimer;
end

function [ planetLine ] = addPlanetAnimatedLine( planetData )
    % create line
    planetLine = animatedline('Marker', 'o', 'Color', 'red');
    addpoints(planetLine, 0, 0, 0);
    % add legend
    legend(planetData.name, 'Location', 'southeast');
end

function planetTimerFcn( planetTimer, ~ )
    planetData = planetTimer.UserData;
    % get current date and convert to Julian calendar
    t = planetData.mainFigure.UserData.controlsContainer.UserData.currentDate;
    t = juliandate(t);
    t0 = 2453560;
    % compute and add coordinates for current date
    [X, Y, Z] = getEclipticalCoordinates(t, t0, planetData.a, planetData.L, planetData.e, planetData.omegaDash, planetData.i, planetData.Omega, planetData.Ldot);
    clearpoints(planetData.planetLine);
    addpoints(planetData.planetLine, X, Y, Z);
end
