local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--config.font = wezterm.font('Departure Mono', { weight = 'Thin' })
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 13.0

config.max_fps = 120
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.90
config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Kanagawa (Gogh)'
--config.color_scheme = 'Adventure'
--config.color_scheme = 'Afterglow'
--config.color_scheme = 'Alien Blood (Gogh)' --Looks awesome in nvim with the Kanagawa theme, I might need to combine those

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
