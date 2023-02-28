-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Disable relativenumber when leaving a buffer ]]
local toggleRelativenumber = vim.api.nvim_create_augroup('toggleRelativenumber', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  desc = 'Enable relative line numbers when entering a buffer',
  group = toggleRelativenumber,
  callback = function()
    vim.wo.relativenumber = true
  end
})

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  desc = 'Remove relative line numbers when leaving a buffer',
  group = toggleRelativenumber,
  callback = function()
    vim.wo.relativenumber = false
  end
})

-- [[ Disable tabexapnd in go files (use tabs not spaces) ]]
local goFiles = vim.api.nvim_create_augroup('goFiles', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.o.expandtab = false
  end,
  group = goFiles,
})
