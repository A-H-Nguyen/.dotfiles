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
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#313244',
  }
}

config.window_background_gradient = {
  -- Can be "Vertical" or "Horizontal".  Specifies the direction
  -- in which the color gradient varies.  
  orientation = 'Vertical',

  colors = {
    '#313244',
    '#1e1e2e',
    '#181825',
    '#11111b',
  },

  -- Specifies the interpolation style to be used.
  -- "Linear", "Basis" and "CatmullRom" as supported.
  interpolation = 'Linear',

  -- How the colors are blended in the gradient.
  -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
  blend = 'Rgb',
}

return config
