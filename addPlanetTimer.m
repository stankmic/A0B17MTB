function addPlanetTimer( name, planetData, mainFigure, arrayPos )
    planetTimer = timer('Name', name, 'TimerFcn', @planetTimerFcn, 'UserData', planetData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
    mainFigure.UserData.planetTimers(arrayPos) = planetTimer;
end

function planetTimerFcn( planetTimer, ~ )
    userData = planetTimer.UserData;
    disp(userData);
end
