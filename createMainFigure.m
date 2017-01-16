function [ mainFigure ] = createMainFigure()
    mainFigure = figure('Units', 'pixels', 'Name', 'Simulace sluneční soustavy', 'NumberTitle', 'off', 'MenuBar', 'none', 'ResizeFcn', @resizeWindowCallback, 'CloseRequestFcn', @closeMainFigureCallback);
end

function closeMainFigureCallback( mainFigure, ~ )
    stop(mainFigure.UserData.timeTimer);
    delete(mainFigure.UserData.timeTimer);
    delete(gcf);
end
