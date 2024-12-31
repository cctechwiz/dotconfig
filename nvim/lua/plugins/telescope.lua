return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>tt', builtin.builtin, { desc = 'Telescope builtins' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = 'Telescope neovim config' })
      vim.keymap.set("n", "<space>fp", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("data") .. "/lazy"
        }
      end, { desc = 'Telescope installed packages' })
    end
  }
}
