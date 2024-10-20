local wezterm = require("wezterm")

-- contains configuration
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 18
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "ayu"

-- config.window_background_opacity = 1
-- config.macos_window_background_blur = 20

return config
