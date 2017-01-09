function [ mainFigure ] = createMainFigure()
    mainFigure = figure('Units', 'pixels', 'Name', 'Simulace sluneční soustavy', 'NumberTitle', 'off', 'MenuBar', 'none', 'ResizeFcn', @resizeWindowCallback);
end
