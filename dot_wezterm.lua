local wezterm = require("wezterm")

-- contains configuration
local config = wezterm.config_builder()

-- need to download kitty term info
-- https://github.com/linkarzu/dotfiles-latest/blob/main/wezterm/wezterm.lua
config.term = "xterm-kitty"
config.enable_kitty_graphics = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- https://wezfurlong.org/wezterm/config/lua/config/animation_fps.html?h=animation
config.animation_fps = 60
-- https://wezfurlong.org/wezterm/config/lua/config/max_fps.html
config.max_fps = 120

-- Fixes small icons
config.allow_square_glyphs_to_overflow_width = "Always"

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "ayu"

config.window_background_opacity = 0.92
config.macos_window_background_blur = 50

-- config.default_cursor_style = "SteadyBlock"
config.default_cursor_style = "BlinkingBlock"
-- config.cursor_blink_ease_out = "Constant"
-- config.cursor_blink_ease_in = "Constant"

-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
-- https://github.com/githubnext/monaspace#monaspace
-- https://monaspace.githubnext.com/
config.font = wezterm.font_with_fallback({
  {
    family = "Monaspace Neon",
    -- family = "Monaspace Argon",
    weight = "Medium",
    harfbuzz_features = { "calt", "ss03", "ss05", "ss07", "ss08" },
  },
  { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "JetBrainsMono NFM", weight = "Medium" },
})

config.font_size = 17

return config
