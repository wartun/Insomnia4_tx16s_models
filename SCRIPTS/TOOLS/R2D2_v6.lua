local inputs = { }
local outputs = { "GtSt" }
local cnt = 0
local image

local function init()
  setSerialBaudrate(115200)
end


local function run()
  local d
  local c
  local v

  lcd.clear()
  lcd.drawText(10, 5, "Channels Data", FONT_BOLD)
  lcd.drawText(200, 5, "R2D2", FONT_MAXI)

  for c=1,10,1 do
    d = "$"
    for i=1,24,1 do
      v = getValue("ch" .. i)
      d = d .. v .. ","
      if c == 1 then
        v = math.floor(v / 2) + 1500
        if i < 17 then
          lcd.drawText(10, 15 + (i * 14), "CH" .. i .. ": " .. v, FONT_MINI)
        else
          lcd.drawText(200, 15 + ((i-16) * 14), "CH" .. i .. ": " .. v, FONT_MINI)
        end
      end
    end
    serialWrite(d .. "\r\n")
  end
  return 0
end

return { output=outputs, run=run, init=init }
