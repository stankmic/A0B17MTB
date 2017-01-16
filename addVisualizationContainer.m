function addVisualizationContainer( mainFigure )
    % create visualization panel
    container = uipanel(mainFigure, 'Title', 'Vizualizace');
    % initialize visualization plot
    initVisualization(container);
    % save visualization panel to UserData
    mainFigure.UserData.visualizationContainer = container;
end

function initVisualization( container )
    % create visualization subplot
    ax = subplot(1, 1, 1, 'Parent', container);
    grid(ax, 'on');
    view(ax, 3);
end
