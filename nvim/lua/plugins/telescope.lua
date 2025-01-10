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

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'Telescope: ' .. desc
        end

        vim.keymap.set('n', keys, func, { desc = desc })
      end

      local builtin = require('telescope.builtin')

      nmap('<leader>tt', builtin.builtin, '[T]elescope builtins')
      nmap('<leader>ff', builtin.find_files, '[F]ind [F]iles')
      nmap('<leader>fs', builtin.live_grep, '[F]ind [S]tring (live grep)')
      nmap('<leader>fb', builtin.buffers, '[F]ind [B]uffers')
      nmap('<leader>fh', builtin.help_tags, '[F]ind [H]elp Tags')
      nmap('<leader>fg', builtin.git_files, '[F]ind [G]it Files')

      nmap('<leader>fD', builtin.diagnostics, '[F]ind all [D]iagnostics')
      nmap('<leader>fd', function()
        builtin.diagnostics {
          bufnr = 0
        }
      end, '[F]ind local [D]iagnostics')

      nmap("<leader>fn", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, '[F]ind [N]eovim Config')

      nmap("<space>fp", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("data") .. "/lazy"
        }
      end, '[F]ind Installed [P]ackages')
    end
  }
}
