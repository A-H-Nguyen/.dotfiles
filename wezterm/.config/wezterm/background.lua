-- This whole file didn't work at all
--
local image_path = '/home/andrew/Pictures/volcano_manor.jpg'
local hsb = {
    brightness = 0.1,
    hue = 0.5,
    saturation = 1.05,
}

-- I had to hardcode some of Catpuccin Mocha's colors
-- https://catppuccin.com/palette
--    '#313244',  -- Surface 0
--    '#1e1e2e',  -- Base
--    '#181825',  -- Mantle
--    '#11111b',  -- Crust
local gradient = {
  orientation = 'Vertical',
  interpolation = 'Linear',
  colors = {
    '#1e1e2e',
    -- '#313244',
    '#181825',
    '#11111b',
  },
  blend = 'Rgb',
}

local opacity = 0.85

return {
    image_path,
    hsb,
    gradient,
    opacity,
}
