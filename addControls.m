function [ container ] = addControls( mainFigure )
    container = uipanel(mainFigure, 'Units', 'Normalized', 'Position', [0 0.92 1 0.08], ...
        'Title', 'Ovládání');
    yearControl(container);
    monthControl(container);
    dayControl(container);
    speedControl(container);
end

function yearControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0 0 0.1 1], ...
        'Style', 'text', 'String', 'Rok:');
    container.UserData.yearControl = uicontrol(container, 'Units', 'Normalized', 'Position', [0.1 0 0.1 1], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function monthControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.2 0 0.1 1], ...
        'Style', 'text', 'String', 'Měsíc:');
    container.UserData.monthControl = uicontrol(container, 'Units', 'Normalized', 'Position', [0.3 0 0.05 1], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function dayControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.4 0 0.1 1], ...
        'Style', 'text', 'String', 'Den:');
    container.UserData.dayControl = uicontrol(container, 'Units', 'Normalized', 'Position', [0.5 0 0.05 1], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function speedControl( container )
    uicontrol(container, 'Units', 'Normalized', 'Position', [0.6 0 0.12 1], ...
        'Style', 'text', 'String', 'Rychlost:');
    container.UserData.speedControl = uicontrol(container, 'Units', 'Normalized', 'Position', [0.72 0 0.1 1], 'BackgroundColor', 'white', ...
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
