function addControls( mainFigure )
    % create control panel
    container = uipanel(mainFigure, 'Title', 'Ovládání');
    % add start date controls
    yearControl(container);
    monthControl(container);
    dayControl(container);
    % add simulation speed control
    speedControl(container);
    % add start date to UserData
    container.UserData.startDate = datetime(1900,1,1);
    % add current simulation date to UserData
    resetCurrentDate(container);
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
        'Callback', @updateDatesIfControlsValuesAreValid);
end

function monthControl( container )
    % add month text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [96 1 48 16], ...
        'Style', 'text', 'String', 'Měsíc:');
    container.UserData.monthControl = uicontrol(container, 'Units', 'pixel', 'Position', [144 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @updateDatesIfControlsValuesAreValid);
end

function dayControl( container )
    % add day text and control
    uicontrol(container, 'Units', 'pixel', 'Position', [192 1 48 16], ...
        'Style', 'text', 'String', 'Den:');
    container.UserData.dayControl = uicontrol(container, 'Units', 'pixel', 'Position', [240 1 48 16], 'BackgroundColor', 'white', ...
        'Style', 'edit', 'String', '', ...
        'Callback', @updateDatesIfControlsValuesAreValid);
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

function updateDatesIfControlsValuesAreValid(editControl, ~)
    container = editControl.Parent;
    areValid = [validateControl(container.UserData.yearControl), validateControl(container.UserData.monthControl), validateControl(container.UserData.dayControl)];
    if (all(areValid))
        updateStartDate( container );
        resetCurrentDate( container );
    end
end

function isValid = validateControl( editControl )
    % set uicontrol background to red if the input is not an integer
    inputText = get(editControl, 'String');
    inputDouble = str2double(inputText);
    isValid = isIntegral(inputDouble);
    if (isValid)
        set(editControl, 'BackgroundColor', 'white');
    else
        set(editControl, 'BackgroundColor', 'red');
    end
end

function result = isIntegral(toTest)
    % return true if the double to test is integral
    result = ( mod(toTest, 1)==0 );
end

function initControls( container )
    % set initial values
    startDate = container.UserData.startDate;
    set(container.UserData.yearControl, 'String', startDate.Year);
    set(container.UserData.monthControl, 'String', startDate.Month);
    set(container.UserData.dayControl, 'String', startDate.Day);
    set(container.UserData.speedControl, 'Value', 1);
end

function updateStartDate( container )
    % update start date in UserData from controls values
    year = str2double(get(container.UserData.yearControl,'String'));
    month = str2double(get(container.UserData.monthControl,'String'));
    day = str2double(get(container.UserData.dayControl,'String'));
    container.UserData.startDate = datetime(year, month, day);
    disp(container.UserData.startDate);
end

function resetCurrentDate( container )
    % reset current date according to start date
    container.UserData.currentDate = container.UserData.startDate;
end
