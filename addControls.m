function addControls( mainFigure )
    container = uicontainer(mainFigure);
    yearControl(container);
    monthControl(container);
    dayControl(container);
    speedSlider(container);
end

function yearControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0 0.95 0.1 0.05], ...
        'Style', 'text', 'String', 'Rok:');
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.1 0.95 0.1 0.05], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function monthControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.2 0.95 0.1 0.05], ...
        'Style', 'text', 'String', 'Měsíc:');
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.3 0.95 0.05 0.05], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function dayControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.4 0.95 0.1 0.05], ...
        'Style', 'text', 'String', 'Den:');
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.5 0.95 0.05 0.05], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function speedSlider( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.6 0.95 0.12 0.05], ...
        'Style', 'text', 'String', 'Rychlost:');
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.72 0.95 0.1 0.05], 'BackgroundColor', 'white', ...
        'Style', 'slider', 'Min', 1, 'Max', 10, 'SliderStep', [1/9 1/9], 'Value', 1, ...
        'Callback', @speedSliderCallback);
end

function speedSliderCallback(src, event)
    disp(src); disp(event);
end

function validateNumberInEditControl(editControl, ~)
    inputText = get(editControl, 'String');
    inputDouble = str2double(inputText);
    if (isIntegral(inputDouble))
        set(editControl, 'BackgroundColor', 'red');
    else
        set(editControl, 'BackgroundColor', 'white');
    end
end

function result = isIntegral(toTest)
    result = ~( mod(toTest, 1)==0 );
end
