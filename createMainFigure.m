function [ mainFigure ] = createMainFigure()
    % create main figure
    mainFigure = figure('Units', 'pixels', 'Name', 'Simulace sluneční soustavy', 'NumberTitle', 'off', 'MenuBar', 'none', 'ResizeFcn', @resizeWindowCallback, 'CloseRequestFcn', @closeMainFigureCallback);
end

function closeMainFigureCallback( mainFigure, ~ )
    % stop and delete time timer
    stop(mainFigure.UserData.timeTimer);
    delete(mainFigure.UserData.timeTimer);
    % stop and delete planet timers
    stop(mainFigure.UserData.planetTimers);
    delete(mainFigure.UserData.planetTimers);
    % close main figure
    delete(mainFigure);
end
