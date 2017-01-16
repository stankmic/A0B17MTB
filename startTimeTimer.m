function startTimeTimer( mainFigure )
    mainFigure.UserData.timeTimer = timer('Name', 'Time timer', 'TimerFcn', @timeTimerFcn, 'UserData', mainFigure.UserData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
    start(mainFigure.UserData.timeTimer);
end

function timeTimerFcn( timeTimer, ~ )
    userData = timeTimer.UserData;
    userData.controlsContainer.UserData.elapsedDays = userData.controlsContainer.UserData.elapsedDays + 1;
    
    newPeriod = 0.1/userData.controlsContainer.UserData.speedControl.Value;
    setTimerPeriod( timeTimer, newPeriod );
end

function setTimerPeriod( timer, newPeriod )
    stop(timer);
    newPeriod = newPeriod - (mod(newPeriod, 0.001));
    timer.StartDelay = newPeriod;
    timer.Period = newPeriod;
    start(timer);
end
