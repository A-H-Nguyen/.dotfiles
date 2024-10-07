local wezterm = require 'wezterm'
local act = wezterm.action

local keys = {
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

return keys
