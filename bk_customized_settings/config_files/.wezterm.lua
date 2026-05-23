-- Rename the file: .wezterm.lua and put it in the home directory

-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


local mux = wezterm.mux
-- This will maximize terminal on start
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)


-- color scheme
config.color_scheme = "Dracula"

-- Resize
local act = wezterm.action
config.window_decorations = "TITLE | RESIZE"

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
--[[
config.initial_cols = 120
config.initial_rows = 40
]]

-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback {
    "MesloLGS NF",
    "Fira Code",
    "JetBrainsMono Nerd Font"
}
config.font_size = 13

-- tabs & tabar
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
config.tab_max_width = 24
config.hide_tab_bar_if_only_one_tab = false


-- background
config.window_background_opacity = .98

-- bold
config.bold_brightens_ansi_colors = "BrightAndBold"


-- Display tab navigator: https://ansidev.substack.com/p/wezterm-cheatsheet
config.keys = {
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = act.ShowTabNavigator,
  },
  -- other keys
}


-- show info about updates
config.show_update_window = true


-- close warning message turn off
config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
  'nu',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}


-- Finally, return the configuration to wezterm:
return config

