-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

require("config.opt")
require("config.remap")
require("config.autocmd")

require("config.lazy")

vim.cmd.colorscheme "catppuccin"

