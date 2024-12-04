local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font('Departure Mono', { weight = 'Thin' })
config.font_size = 11.0

config.max_fps = 120
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.90
config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Kanagawa (Gogh)'

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config
