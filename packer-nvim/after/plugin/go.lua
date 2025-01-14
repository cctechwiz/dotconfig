-- [[ Disable tabexapnd in go files (use tabs not spaces) ]]
local goFiles = vim.api.nvim_create_augroup('goFiles', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.o.expandtab = false
  end,
  group = goFiles,
})

-- [[ Run gofmt + goimport on save ]]
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup({
  tag_transform = 'camelcase',
})
