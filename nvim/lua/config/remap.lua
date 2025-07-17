-- [[ Set leader to space ]]
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- [[ No weird space moving or entering insert mode ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = "No weird space moving or entering insert mode" })

-- [[ Open netrw ]]
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex, { desc = "Open netrw" })

-- [[ Move selected lines ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- [[ Keep cursor after line merge ]]
vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor after line merge" })

-- [[ Center cursor w/ half page jump ]]
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page jump down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page jump up and center cursor" })

-- [[ Center cursor w/ next/prev search ]]
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search item and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search item and center cursor" })

-- [[ Paste over selected text w/o replacing yank ]]
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selected text without replacing yank register" })

-- [[ Delete w/o replacing yank ]]
-- vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without replacing yank register" })

-- [[ Disable Q ]]
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable useless Q key" })

-- [[ Format buffer ]]
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current buffer" })

-- [[ Navigate splits ]]
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate splits left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate splits down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate splits up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate splits right" })

-- [[ Navigate splits ]]
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sd", "<C-w>s", { desc = "Split horizontally" })

-- [[ Navigate buffers ]]
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>", { desc = "Navigate previous buffer" })
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>", { desc = "Navigate next buffer" })

-- [[ Remap for dealing with word wrap ]]
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Remap for dealing with word wrap" })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Remap for dealing with word wrap" })

-- [[ Substitute word under cursor ]]
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

-- [[ Source current file ]]
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- [[ Execute Lua code under cursor or selected ]]
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute Lua code line under cursor" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute Lua code visually selected" })

-- [[ Clear highlighting :set nohl ]]
vim.keymap.set("n", "<leader><leader>", "<cmd>nohl<CR>", { desc = "Clear highlighting" })

-- [[ Close all but current buffer ]]
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all but the current buffer" })

-- [[ Navigate quick fix list ]]
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Next quickfix location" })
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Previous quickfix location" })
-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Next quickfix list item" })
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix list item" })
-- vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
-- vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- [[ Toggle column highlighting  ]]
-- vim.keymap.set("n", "<leader>hc", function()
--   vim.o.cursorcolumn = not vim.o.cursorcolumn
-- end, { desc = "Toggle column highlighting" })

-- [[ Toggle relative line numbers  ]]
-- vim.keymap.set("n", "<leader>nn", function()
--   vim.o.relativenumber = not vim.o.relativenumber
-- end, { desc = "Toggle relative line numbers" })
