-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.keys = {
  {
    key = '%',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '"',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '|',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '_',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'H',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'J',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'K',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'L',
    mods = 'CMD|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
}

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
config.pane_focus_follows_mouse = true

config.window_background_image = '/home/andrew/Pictures/volcano_manor.jpg'
-- config.window_background_image = '/home/andrew/Pictures/spooderman.gif'
config.window_background_image_hsb = {
  brightness = 0.1,
  hue = 0.5,
  saturation = 1.05,
}

-- fancy gradient, incompatible with background image
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

-- I think transparent terminal only looks good with tiling window managers
-- config.window_background_opacity = 0.85

return config
