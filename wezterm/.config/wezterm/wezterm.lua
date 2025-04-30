local wezterm = require 'wezterm'
local keybinds = require 'keybinds'
-- local background = require 'background'

local config = wezterm.config_builder()

config.enable_wayland = false
config.audible_bell = "Disabled"

--=============================================================================
-- Set font and disable ligatures
--=============================================================================

config.font = wezterm.font 'MesloLGS NF'

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

--=============================================================================
-- Set overall colorscheme and set tab bar style
--=============================================================================

config.color_scheme = 'Catppuccin Mocha'

config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = '#313244',
  }
}

config.hide_tab_bar_if_only_one_tab = true

--=============================================================================
-- Set keybinds
--=============================================================================

config.keys = keybinds

config.pane_focus_follows_mouse = true

--=============================================================================
-- Set background. Make sure it's EITHER a background image or a gradient
-- see background.lua for more info
--=============================================================================
-- config.window_background_image = '/home/andrew/Pictures/volcano_manor.jpg'
-- config.window_background_image_hsb = {
--     brightness = 0.2,
--     hue = 0.5,
--     saturation = 1.05,
-- }

-- fancy gradient, incompatible with background image
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
config.window_background_gradient = gradient

-- I think transparent terminal only looks good with tiling window managers
-- config.window_background_opacity = 0.85


--=============================================================================
return config
