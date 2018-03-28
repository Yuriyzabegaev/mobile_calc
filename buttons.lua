local Module = {}


local function button(text, x, y, sizeX, sizeY, color, colorTouch)
    local rect = display.newRect(x, y, sizeX, sizeY)
    rect.fillColor = { 0, 0, 0, 1 }
    rect.fillColor = color
    rect.fillColorTouch = colorTouch
    rect:setFillColor(unpack((rect.fillColor)))

    local l = 0.8 * ((rect.contentWidth > rect.contentHeight) and rect.contentWidth or rect.contentHeight)

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

Module.button = button

return Module