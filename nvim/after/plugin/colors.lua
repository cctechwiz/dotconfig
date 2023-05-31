function SetColors(color)
  color = color or 'everforest'

  -- vim.g.tokyonight_dark_float = false
  -- vim.g.tokyonight_colors = { bg_float = 'none' }

  -- https://github.com/sainnhe/everforest/blob/master/doc/everforest.txt (:help everforest)
  vim.g.everforest_background = 'hard'
  vim.g.everforest_transparent_background = 2
  vim.g.everforest_better_performance = 1
  vim.g.everforest_diagnostic_text_highlight = 1
  vim.g.everforest_diagnostic_virtual_text = 'colored'


  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTitle', { ctermbg = 'none', bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTask', { ctermbg = 'none', bg = 'none' })
end

SetColors()
