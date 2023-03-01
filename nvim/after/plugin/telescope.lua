local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ss', function()
  builtin.grep_string({ search =  vim.fn.expand("<cword>") })
end)

vim.keymap.set('n', '<leader>fr', function()
  builtin.lsp_references({ noremap = true, silent = true })
end)
