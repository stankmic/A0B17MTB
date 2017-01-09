function [ visualizationContainer ] = addVisualizationContainer( mainFigure )
    visualizationContainer = uipanel(mainFigure, 'Units', 'Normalized', 'Position', [0 0 1 0.92], ...
        'Title', 'Vizualizace');
end

