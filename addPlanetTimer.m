function addPlanetTimer( mainFigure, planetData, arrayPos )
    % add animater line for the planet
    planetData.planetLine = addPlanetAnimatedLine(planetData);
    % create planet timer
    planetTimer = timer('Name', planetData.name, 'TimerFcn', @planetTimerFcn, 'UserData', planetData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
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
    userData = planetTimer.UserData;
    clearpoints(userData.planetLine);
    addpoints(userData.planetLine, 0,0,0);
    % TODO recalculate new position for the planet animated line
end
