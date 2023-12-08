require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    file_ignore_patterns = {
      "node_modules", ".git", "yarn.lock"
    },
  },
}

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

vim.keymap.set('n', '<leader>ss', function()
  require('sg.extensions.telescope').fuzzy_search_results()
end)
