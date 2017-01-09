function addMenu( mainFigure )
    toolbar = uitoolbar(mainFigure);
    uipushtool(toolbar,'TooltipString', 'Upravit seznam objektů', 'ClickedCallback', @debugCallback);
    uipushtool(toolbar,'TooltipString', 'Spustit', 'ClickedCallback', @debugCallback);
    uipushtool(toolbar,'TooltipString', 'Zastavit', 'ClickedCallback', @debugCallback);
    mainFigure.UserData.menuToolbar = toolbar;
end

function editObjectCallback(~, ~)
end

function startCallback(~, ~)
end

function stopCallback(~, ~)
end

function debugCallback(src, event)
    disp(src); disp(event);
end
