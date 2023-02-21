function SetColors(color)
  color = color or 'nightfox'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTitle', { ctermbg = 'none', bg = 'none' })
  vim.api.nvim_set_hl(0, 'FidgetTask', { ctermbg = 'none', bg = 'none' })
end

SetColors()
