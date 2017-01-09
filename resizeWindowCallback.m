function resizeWindowCallback(mainFigure, ~)
    newPos = mainFigure.Position;
    if ( numel(mainFigure.UserData) > 0 )
        set(mainFigure.UserData.controlsContainer, 'Units', 'pixel');
        set(mainFigure.UserData.visualizationContainer, 'Units', 'pixel');
        set(mainFigure.UserData.controlsContainer, 'Position', [0 newPos(4)-34 newPos(3) 34]);
        set(mainFigure.UserData.visualizationContainer, 'Position', [0 0 newPos(3) newPos(4)-34]);
    end
end
