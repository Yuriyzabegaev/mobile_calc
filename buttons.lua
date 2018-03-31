local Module = {}


local function make_button(text, x, y, sizeX, sizeY, color, colorTouch, strokeColor, strokeWidth)
    local rect = display.newRect(x, y, sizeX, sizeY)
    rect.fillColor = { 0, 0, 0, 1 }
    rect.fillColor = color
    rect.fillColorTouch = colorTouch
    rect.stroke = strokeColor
    rect.strokeWidth = strokeWidth
    rect:setFillColor(unpack((rect.fillColor)))

    local l = 0.5 * ((rect.contentWidth > rect.contentHeight) and rect.contentWidth or rect.contentHeight)

    local text = display.newText(text, rect.x, rect.y, native.systemFont, l, "center")

    local function changeButtonColor(event)

        print(event.phase)
        if event.phase == "began" then
            display.getCurrentStage():setFocus(event.target)
            event.target:setFillColor(unpack(rect.fillColorTouch))

        elseif (event.phase == "ended" or event.phase == "cancelled") then
            display.getCurrentStage():setFocus(nil)
            event.target:setFillColor(unpack(event.target.fillColor))
        end

    end

    rect:addEventListener("touch", changeButtonColor)

    return rect
end

local function buttons (buttonsList, yMax)

    local xMax = 0
    local xMin = display.contentWidth
    local yMin = display.contentHeight
    local areaSizeX = xMin - xMax
    local areaSizeY = yMin - yMax

    local defaultColor = { 0, .5, .5, 1 }
    local defaultTouchColor = { 1, 1, 1, 1 }
    local defaultStrokeColor = { 1, 0, 0.5 }
    local defaultStrokeWidth = 4

    local nStrings = table.getn(buttonsList)
    local nColumns = table.getn(buttonsList[1])

    local buttonSizeX = areaSizeX / nColumns
    local buttonSizeY = areaSizeY / nStrings
    local buttonCenterX = buttonSizeX / 2
    local buttonCenterY = buttonSizeY / 2

    local buttons = {}
    for i = 1, #buttonsList do
        local buttonStr = buttonsList[i]

        for j = 1, #buttonStr do
            local button = make_button(buttonStr[j],
                                       buttonCenterX * 2 * (j) - buttonCenterX,
                                       yMax + buttonCenterY * 2 * (i) - buttonCenterY,
                                       buttonSizeX,
                                       buttonSizeY,
                                       defaultColor,
                                       defaultTouchColor,
                                       defaultStrokeColor,
                                       defaultStrokeWidth)
            print(buttonStr[j],
                                       buttonCenterX * 2 * (j) - buttonCenterX,
                                       buttonCenterY * 2 * (i) - buttonCenterY,
                                       buttonSizeX,
                                       buttonSizeY,
                                       defaultColor,
                                       defaultTouchColor)
            table.insert(buttons, {string.format("%d - %d", i, j)})

        end
    end
    return table
end



Module.buttons = buttons

return Module