-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local buttons = require("buttons")
local make_button = buttons.button
-- local platform = display.newImageRect( "platform.png", 300, 50 )
-- platform.x = display.contentCenterX
-- platform.y = display.contentHeight - 25

-- local balloon = display.newImageRect( "balloon.png", 112, 112 )
-- balloon.x = display.contentCenterX
-- balloon.y = display.contentCenterY
-- balloon.alpha = 0.8

-- local physics = require( "physics" )
-- physics.start()

-- physics.addBody( platform, "static" )
-- physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )

-- local function pushBalloon()
--     balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
-- end

-- background:addEventListener( "tap", pushBalloon )

-- local button1 = display.newRoundedRect()

-- local rect_properties = {x=display.contentCenterX, y=display.contentCenterY, }

local function buttons ()
    local arg_table = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
    local buttonsList = {}
    for i = 1, nButtons do
        local x = i*10 + 50
        local y = x
        table.insert(buttonsList, make_button(x, y))
    end
    return buttonsList
end

local arg_table = {1, 2, 3, 4}

-- local sx = rect.contentWidth/text.contentWidth
-- local sy = rect.contentHeight/text.contentHeight
-- local scale = (sx < sy ) and sx or sy

-- text:scale( scale, scale )

-- native.getFontNames()