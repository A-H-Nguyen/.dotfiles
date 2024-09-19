-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'MesloLGS NF'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- I had to hardcode some of Catpuccin Mocha's colors
-- https://catppuccin.com/palette
--    '#313244',  -- Surface 0
--    '#1e1e2e',  -- Base
--    '#181825',  -- Mantle
--    '#11111b',  -- Crust
config.color_scheme = 'Catppuccin Mocha'

config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = '#313244',
  }
}

config.hide_tab_bar_if_only_one_tab = true

-- config.window_background_gradient = {
--   orientation = 'Vertical',
--   interpolation = 'Linear',
--   colors = {
--     '#1e1e2e',
--     -- '#313244',
--     '#181825',
--     '#11111b',
--   },
--   blend = 'Rgb',
-- }

config.window_background_image = '/home/andrew/Pictures/volcano_manor.jpg'
config.window_background_image_hsb = {
  brightness = 0.25,
  hue = 0.5,
  saturation = 1.05,
}

-- I think transparent terminal only looks good with tiling window managers
-- config.window_background_opacity = 0.85

return config
