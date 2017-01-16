function startTimeTimer( mainFigure )
    % create time timer and start it
    mainFigure.UserData.timeTimer = timer('Name', 'Time timer', 'TimerFcn', @timeTimerFcn, 'UserData', mainFigure.UserData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
    start(mainFigure.UserData.timeTimer);
end

function timeTimerFcn( timeTimer, ~ )
    userData = timeTimer.UserData;
    % increment elapsed days
    userData.controlsContainer.UserData.currentDate = userData.controlsContainer.UserData.currentDate + days(1);
    
    % set new period based on the speed control
    newPeriod = 0.1/userData.controlsContainer.UserData.speedControl.Value;
    setTimerPeriod( timeTimer, newPeriod );
end

function setTimerPeriod( timer, newPeriod )
    % stop the timer to allow update
    stop(timer);
    % strip the new period to milliseconds
    newPeriod = newPeriod - (mod(newPeriod, 0.001));
    % set new timer start delay and period
    timer.StartDelay = newPeriod;
    timer.Period = newPeriod;
    % start the timer again
    start(timer);
end
