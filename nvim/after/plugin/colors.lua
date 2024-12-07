function SetColors(color)
  color = color or 'github_dark'

  require('kanagawa').setup({
    undercurl = true,
    transparent = true,
    dimInactive = false,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            bg = "none",
          }
        }
      }
    }
  })

  -- Default options
  require('github-theme').setup({
    options = {
      hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
      hide_nc_statusline = true, -- Override the underline style for non-active statuslines
      transparent = true,       -- Disable setting bg (make neovim's background transparent)
      terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,      -- Non focused panes set to alternative background
    }
  })

  -- vim.g.tokyonight_dark_float = false
  -- vim.g.tokyonight_colors = { bg_float = 'none' }

  -- https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt (:help everforest)
  -- vim.g.everforest_background = 'hard'
  -- vim.g.everforest_transparent_background = 2
  -- vim.g.everforest_better_performance = 1
  -- vim.g.everforest_diagnostic_text_highlight = 1
  -- vim.g.everforest_diagnostic_virtual_text = 'colored'

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTitle', { ctermbg = 'none', bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTask', { ctermbg = 'none', bg = 'none' })
end

SetColors()
