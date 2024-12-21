local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_cwd = wezterm.home_dir

--config.font = wezterm.font('Departure Mono', { weight = 'Regular' })
--config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font = wezterm.font('JetBrainsMono Nerd Font Mono', { weight = 'Regular' })
config.font_size = 12.0

config.audible_bell = "Disabled"
config.max_fps = 120
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.80
config.text_background_opacity = 0.80
config.enable_tab_bar = false
-- config.tab_bar_at_bottom = true

-- https://wezfurlong.org/wezterm/colorschemes/index.html
--config.color_scheme = 'Adventure'
--config.color_scheme = 'Afterglow'
--config.color_scheme = 'Alien Blood (Gogh)'
--config.color_scheme = 'Atelierdune (dark) (terminal.sexy)'
--config.color_scheme = 'Breeze (Gogh)'
--config.color_scheme = 'Cai (Gogh)'
config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Darcula (base16)'
--config.color_scheme = 'Dark Ocean (terminal.sexy)'
--config.color_scheme = 'Darktooth (base16)'
--config.color_scheme = 'Default (dark) (terminal.sexy)' -- Good
--config.color_scheme = 'Earthsong'
--config.color_scheme = 'Edge Dark (base16)'
--config.color_scheme = 'Everforest Dark (Gogh)'
--config.color_scheme = 'FishTank'
--config.color_scheme = 'ForestBlue'
--config.color_scheme = 'GitHub Dark' -- Good
--config.color_scheme = 'Gruber (base16)'
--config.color_scheme = 'Gruvbox dark, hard (base16)' -- Good
--config.color_scheme = 'Gruvbox Dark (Gogh)'
--config.color_scheme = 'Gruvbox Material (Gogh)'
--config.color_scheme = 'GruvboxDarkHard'
--config.color_scheme = 'Hybrid'
--config.color_scheme = 'Kanagawa (Gogh)'
--config.color_scheme = 'Moonfly (Gogh)' -- Good
--config.color_scheme = 'Railscasts (base16)'
--config.color_scheme = 'Red Planet'
--config.color_scheme = 'Terminix Dark (Gogh)' -- Good
--config.color_scheme = 'Tomorrow Night'
--config.color_scheme = 'Vag (Gogh)'
--config.color_scheme = 'Violet Dark'
--config.color_scheme = 'kanagawabones'
--config.color_scheme = 'neobones_dark'
--config.color_scheme = 'terafox'
--config.color_scheme = 'zenwritten_dark'

-- Overwritting the built-in theme colors:
-- https://github.com/catppuccin/wezterm/blob/main/plugin/init.lua
-- local customTheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- Replace teal with green
-- customTheme.ansi[7] = "#a6e3a1"
-- customTheme.brights[7] = "#a6e3a1"
-- Replace teal with sapphire
-- customTheme.ansi[7] = "#74c7ec"
-- customTheme.brights[7] = "#74c7ec"

-- config.color_schemes = {
--   ["OLEDppuccin"] = customTheme,
-- }
-- config.color_scheme = 'OLEDppuccin'

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
