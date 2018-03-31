-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
require("mobdebug").start()
Runtime:addEventListener("enterFrame", function(event) pcall(onUpdate, event) end)

require("display")
local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local B = require("buttons")
local utils = require("utils")
local buttons = B.buttons

local buttonsList = { { "AC", "BC", "%", "div" },
                          { "7", "8", "9", "*" },
                          { "4", "5", "6", "-" },
                          { "1", "2", "3", "+" },
                          { "0", ",", "+/-", "=" } }


local b = buttons(buttonsList, display.contentHeight/4)


-- local sx = rect.contentWidth/text.contentWidth
-- local sy = rect.contentHeight/text.contentHeight
-- local scale = (sx < sy ) and sx or sy

-- text:scale( scale, scale )

-- native.getFontNames()

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
