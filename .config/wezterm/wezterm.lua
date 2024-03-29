local wezterm = require 'wezterm';
local config = {}

-- If you open up fullscreen by accident, use ALT+Enter. Alt is the top-right
-- key on your left keyboard

config.audible_bell = "Disabled"
config.color_scheme = "Blue Matrix"
config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14
config.native_macos_fullscreen_mode = false
config.visual_bell = { fade_in_duration_ms = 75, fade_out_duration_ms = 75, target = 'CursorColor' }

return config
