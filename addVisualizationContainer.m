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
    % add red circle to [0 0 0]
    container.UserData.plot = animatedline(ax, 'Marker', 'o', 'Color', 'red');
    addpoints(container.UserData.plot, 0, 0, 0);
    drawnow();
    %hold on;
    %container.UserData.plotX = plot3(ax, 1, 2, 3, 'o', 'Color', 'blue');
    %hold off;
    % add legend
    legend('Red circle', 'Location', 'southeast');
end
