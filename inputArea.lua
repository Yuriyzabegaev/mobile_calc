M = {}

local function drawInputArea (yInputSize)
  
  display.setStatusBar( display.LightTransparentStatusBar )
  local xCenter = display.contentCenterX
  local yCenter = yInputSize/2
  local screen = display.newRect(xCenter, yCenter, display.contentWidth, yInputSize)
  screen.fill = {0,0,0,1}
  
  local inputString = "we"
  local l = utils.getFontSize(screen, .2)
  
  local args = 
{
    text = inputString,     
    x = display.contentWidth * .98,
    y = (yInputSize - (l * 1.3)/2),
    font = native.systemFont,   
    fontSize = l,
    align = "right"
}
  local input = display.newText( args )
  input.anchorX = display.contentWidth
  input.screen = screen
  function input:insert(str)
    print(str)
    
    if str == "AC" then
      self.text = "0"
      return
    end
    
    if str == "C" then
      if #self.text <= 1 then
        self.text = "0"
      else
        self.text = self.text:sub(1, -2)
      end
      return
    end
    
    if str == "*" or str == "+" or str == "-" or str == "div" then
      local len = #self.text
      local prev = self.text:sub(-1, len)
      if prev == "*" or prev == "+" or prev == "-" or prev == "div" then
        if prev == str then
          return
        end
        self.text = self.text:sub(1, -2)..str
        return
      end
    end
    
    if #self.text <= 1 and self.text =="0" and str ~= "," then
      self.text = str
      return
    end
    self.text = self.text .. str
  end
  
  return input

end

M.drawInputArea = drawInputArea
return M