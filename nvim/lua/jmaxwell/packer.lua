vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --packer
  use 'wbthomason/packer.nvim'


  --telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  --treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/playground'

  --lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional

       -- Useful status updates for LSP
       {'j-hui/fidget.nvim'},

      -- Additional lua configuration, makes nvim stuff amazing
      {'folke/neodev.nvim'},
    }
  }


  --git
  use 'tpope/vim-fugitive'


  --misc
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'


  --themes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'

end)
