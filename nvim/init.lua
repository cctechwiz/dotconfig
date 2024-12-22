-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

-- TODO: Move these to different config files
vim.cmd.colorscheme "catppuccin"

vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"

-- Source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- Execute Lua code under cursor or selected
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
