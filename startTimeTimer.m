function startTimeTimer( mainFigure )
    % create time timer and start it
    mainFigure.UserData.timeTimer = timer('Name', 'Time timer', 'TimerFcn', @timeTimerFcn, 'UserData', mainFigure.UserData, 'ExecutionMode', 'fixedSpacing', 'Period', 0.1);
    start(mainFigure.UserData.timeTimer);
end

function timeTimerFcn( timeTimer, ~ )
    userData = timeTimer.UserData;
    % increment elapsed days
    speedValue = userData.controlsContainer.UserData.speedControl.Value;
    userData.controlsContainer.UserData.currentDate = userData.controlsContainer.UserData.currentDate + days(speedValue);
end
