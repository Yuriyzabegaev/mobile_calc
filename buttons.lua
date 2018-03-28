local Module = {}


local function button(x, y)
    local rect = display.newRect(x, y, 90, 90)
    rect.fillColor = { 0, 0, 0, 1 }
    rect:setFillColor(unpack((rect.fillColor)))

    local l = 0.8 * ((rect.contentWidth > rect.contentHeight) and rect.contentWidth or rect.contentHeight)

    local text = display.newText("1", rect.x, rect.y, native.systemFont, l, "center")

    local function changeButtonColor(event)

        print(event.phase)
        if event.phase == "began" then
            display.getCurrentStage():setFocus(event.target)
            event.target:setFillColor(0, 0, 1, 1)

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