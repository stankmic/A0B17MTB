function addControls( mainFigure )
    % create control panel
    container = uipanel(mainFigure, 'Title', 'Ovládání');
    % add start date controls
    yearControl(container);
    monthControl(container);
    dayControl(container);
    % add simulation speed control
    speedControl(container);
    % add field for number of days elapsed from the start date
    container.UserData.elapsedDays = 0;
    % set initial values
    initControls(container);
    % save control panel to UserData
    mainFigure.UserData.controlsContainer = container;
end

function yearControl( container )
    % add year text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [0 1 48 16], ...
        'Style', 'text', 'String', 'Rok:');
    container.UserData.yearControl = uicontrol(container, 'Units', 'pixel', 'Position', [48 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function monthControl( container )
    % add month text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [96 1 48 16], ...
        'Style', 'text', 'String', 'Měsíc:');
    container.UserData.monthControl = uicontrol(container, 'Units', 'pixel', 'Position', [144 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function dayControl( container )
    % add day text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [192 1 48 16], ...
        'Style', 'text', 'String', 'Den:');
    container.UserData.dayControl = uicontrol(container, 'Units', 'pixel', 'Position', [240 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @validateNumberInEditControl);
end

function speedControl( container )
    % add speed text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [288 1 64 16], ...
        'Style', 'text', 'String', 'Rychlost:');
    container.UserData.speedControl = uicontrol(container, 'Units', 'pixel', 'Position', [352 1 72 16], 'BackgroundColor', 'white', ...
        'Style', 'slider', 'Min', 1, 'Max', 10, 'SliderStep', [1/9 1/9], 'Value', 1, ...
        'Callback', @speedSliderCallback);
end

function speedSliderCallback(src, event)
    % display arguments
    disp(src); disp(event);
end

function validateNumberInEditControl(editControl, ~)
    % set uicontrol background to red if the input is not an integer
    inputText = get(editControl, 'String');
    inputDouble = str2double(inputText);
    if (isIntegral(inputDouble))
        set(editControl, 'BackgroundColor', 'red');
    else
        set(editControl, 'BackgroundColor', 'white');
    end
end

function result = isIntegral(toTest)
    % return true if the double to test is integral
    result = ~( mod(toTest, 1)==0 );
end

function initControls( controls )
    % set initial values
    set(controls.UserData.yearControl, 'String', 1900);
    set(controls.UserData.monthControl, 'String', 1);
    set(controls.UserData.dayControl, 'String', 1);
    set(controls.UserData.speedControl, 'Value', 1);
end
