function addControls( mainFigure )
    container = uipanel(mainFigure, 'Title', 'Ovládání');
    yearControl(container);
    monthControl(container);
    dayControl(container);
    speedControl(container);
    mainFigure.UserData.controlsContainer = container;
end

function yearControl( container )
    uicontrol(container, 'Units', 'pixel', 'Position', [0 1 48 16], ...
        'Style', 'text', 'String', 'Rok:');
    container.UserData.yearControl = uicontrol(container, 'Units', 'pixel', 'Position', [48 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function monthControl( container )
    uicontrol(container, 'Units', 'pixel', 'Position', [96 1 48 16], ...
        'Style', 'text', 'String', 'Měsíc:');
    container.UserData.monthControl = uicontrol(container, 'Units', 'pixel', 'Position', [144 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function dayControl( container )
    uicontrol(container, 'Units', 'pixel', 'Position', [192 1 48 16], ...
        'Style', 'text', 'String', 'Den:');
    container.UserData.dayControl = uicontrol(container, 'Units', 'pixel', 'Position', [240 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function speedControl( container )
    uicontrol(container, 'Units', 'pixel', 'Position', [288 1 64 16], ...
        'Style', 'text', 'String', 'Rychlost:');
    container.UserData.speedControl = uicontrol(container, 'Units', 'pixel', 'Position', [352 1 72 16], 'BackgroundColor', 'white', ...
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
