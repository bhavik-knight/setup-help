-- Rename the file: .wezterm.lua and put it in the home directory


-- Pull in the wezterm API
local wezterm = require "wezterm"


-- This will hold the configuration.
local config = {}


if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Force the shell to load profile/path correctly
-- config.default_prog = { "/usr/bin/fish", "-l" } 


-- color scheme
config.color_scheme = 
-- "Monokai (terminal.sexy)"
-- "Catppuccin Frappe (Gogh)"
-- "Dracula+"
-- "Horizon Dark (Gogh)"
-- "iTerm2 Pastel Dark Background"
"Neon (terminal.sexy)"
-- "Nord"
-- "Sequoia Moonlight"


local mux = wezterm.mux
-- This will maximize terminal on start
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

--
-- Custom window title
wezterm.on("gui-startup", function(cmd)
    return "🐟 Fish Terminal"
end)


-- Resize
local act = wezterm.action
config.window_decorations = "RESIZE | TITLE"


-- This is where you actually apply your config choices.
-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 40


-- or, changing the font size and color scheme.
config.font = wezterm.font_with_fallback {
    "ComicShannsMono Nerd Font",
    "MesloLGS NF",
    "Fira Code",
    "JetBrainsMono Nerd Font"
}


-- size, bold, bright
config.font_size = 15
config.bold_brightens_ansi_colors = "BrightAndBold"


-- background
config.window_background_opacity = .98


-- tabs & tabar
config.use_fancy_tab_bar = true
config.enable_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
config.tab_max_width = 24
config.hide_tab_bar_if_only_one_tab = false


-- show info about updates
config.show_update_window = true


-- don"t show confirmation dialogue
config.window_close_confirmation = "NeverPrompt"

-- close warning message turn off
config.skip_close_confirmation_for_processes_named = {
    "bash",
    "sh",
    "zsh",
    "fish",
    "tmux",
    "nu",
    "cmd.exe",
    "pwsh.exe",
    "powershell.exe",
}


-- other keys
config.keys = {
    -- Display tab navigator: https://ansidev.substack.com/p/wezterm-cheatsheet
    {
        key = "t",
        mods = "SHIFT | CMD",
        action = act.ShowTabNavigator,
    },

    -- close current tab without confirmation with shift + ctrl + w
    {
        key = "w",
        mods = "SHIFT | CTRL",
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
}


-- cofigure mouse bindings
config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = act.CloseCurrentPane { confirm = false },
    }
}


-- Finally, return the configuration to wezterm:
return config

