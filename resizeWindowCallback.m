function resizeWindowCallback(mainFigure, ~)
    newPos = mainFigure.Position;
    % check UserData already contain the panels
    if ( numel(mainFigure.UserData) > 0 )
        % set panels units to pixels
        set(mainFigure.UserData.controlsContainer, 'Units', 'pixel');
        set(mainFigure.UserData.visualizationContainer, 'Units', 'pixel');
        % set panels position based on the main figure position
        set(mainFigure.UserData.controlsContainer, 'Position', [0 newPos(4)-34 newPos(3) 34]);
        set(mainFigure.UserData.visualizationContainer, 'Position', [0 0 newPos(3) newPos(4)-34]);
    end
end
