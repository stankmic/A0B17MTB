function addPlanetTimer( name, planetData, mainFigure, arrayPos )
    % create planet timer
    planetTimer = timer('Name', name, 'TimerFcn', @planetTimerFcn, 'UserData', planetData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
    % save planet timer to UserData
    mainFigure.UserData.planetTimers(arrayPos) = planetTimer;
end

function planetTimerFcn( planetTimer, ~ )
    userData = planetTimer.UserData;
    disp(userData);
    % TODO recalculate new position for the planet animated line
end
