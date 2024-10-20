local wezterm = require("wezterm")

-- contains configuration
local config = wezterm.config_builder()

-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
-- https://github.com/githubnext/monaspace#monaspace
-- https://monaspace.githubnext.com/
config.font = wezterm.font_with_fallback({
  {
    family = "Monaspace Neon",
    weight = "Medium",
    harfbuzz_features = { "calt", "ss02", "ss03", "ss07", "ss08", "ss09" },
  },
  { family = "Symbols Nerd Font", weight = "Medium" },
  -- { family = "JetBrainsMono NFM", weight = "Medium" },
})

config.font_size = 18
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "ayu"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 30

return config
