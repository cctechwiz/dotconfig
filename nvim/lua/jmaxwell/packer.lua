-- -- Updating Packages -- -- 
-- :so
-- :PackerSync
-- :TSUpdate
-- :MasonUpdate (or :Mason --> U)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --packer
  use 'wbthomason/packer.nvim'

  --telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
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

  --fzf
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }

  --lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'v1.4.5' },

      -- Additional lua configuration, makes nvim stuff amazing
      { 'folke/neodev.nvim' },
    }
  }

  --sourcegraph cody
  use {
    'sourcegraph/sg.nvim',
    run = 'nvim -l build/init.lua',
  }

  --golang
  use {
    'ray-x/go.nvim',
    requires = {
      -- Floating window support
      'ray-x/guihua.lua', -- Optional
    }
  }

  --git
  use 'tpope/vim-fugitive'

  --misc
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    -- tag = "v3.*", -- Removed to fix bug with nvim >=0.10.0 per https://github.com/akinsho/bufferline.nvim/issues/903
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use 'vimwiki/vimwiki'
  use 'NoahTheDuke/vim-just'

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  --terminal integration
  use {
    'knubie/vim-kitty-navigator',
    run = 'cp ./*.py ~/.config/kitty/',
  }

  use { 'christoomey/vim-tmux-navigator' }

  --themes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use 'sainnhe/everforest'
  use 'rebelot/kanagawa.nvim'
  use 'projekt0n/github-nvim-theme'
  use { "catppuccin/nvim", as = "catppuccin" }
end)
