local SDL = require "SDL"
-- local ttf = require "SDL.ttf"

--[[
   while (true) do
   gui.text(50, 50, "Hello World!");
   emu.frameadvance();
   end;
--]]

if SDL.mouseIsHaptic() then
   print("Mouse Haptic")
end

-- Initialize SDL
local ret, err = SDL.init {
   SDL.flags.Video
}

if not ret then
   error(err)
end

-- Create Window
local win, err = SDL.createWindow {
   title = "Vision Renderer",
   width = 800,
   height = 600,
   flags = { SDL.window.Resizable }
}

if not win then
   error(err)
end

-- Create Renderer
local rdr, err = SDL.createRenderer(win, -1, SDL.rendererAccelerated)

if not rdr then
   error(err)
end

-- Initialize Sample Rectangles
local rect = {
   w = 10, h = 10, x = 0, y = 0
}

-- "GAME LOOP"
while true do
   for key in SDL.pollEvent() do
      if key.type == SDL.event.Quit then
	 goto sdlquit
      end
   end

   -- Renderer Overhead
   rdr:setDrawColor(0x000000)
   rdr:clear()

   rdr:setDrawColor(0xFF0000)
   rdr:fillRect(rect)

   rdr:present()

   rect.x = rect.x + 1
   rect.y = rect.y + 1

   SDL.delay(100)
   
end

::sdlquit::
SDL.quit();
