function addVisualizationContainer( mainFigure )
    container = uipanel(mainFigure, 'Title', 'Vizualizace');
    mainFigure.UserData.visualizationContainer = container;
end

