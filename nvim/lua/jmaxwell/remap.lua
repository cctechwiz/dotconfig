vim.g.mapleader = " "

-- [[ Open netrw ]]
vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)

-- [[ Move selected lines ]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- [[ Keep cursor after line merge ]]
vim.keymap.set("n", "J", "mzJ`z")

-- [[ Center cursor w/ half page jump ]]
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- [[ Center cursor w/ next/prev search ]]
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- [[ Paste over selected text w/o replacing yank ]]
vim.keymap.set("x", "<leader>p", [["_dP]])

-- [[ Yank to system clipboard ]]
--vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])

-- [[ Delete w/o replacing yank ]]
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- [[ Disable Q ]]
vim.keymap.set("n", "Q", "<nop>")

-- [[ Switch tmux sessions ]]
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- [[ Format buffer ]]
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- [[ Navigate quick fix list ]]
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- [[ Navigate splits ]]
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- [[ Navigate buffers ]]
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>")

-- [[ Remap for dealing with word wrap ]]
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Substitute word under cursor ]]
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- [[ Make current file executable ]]
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- [[ Edit packer config ]]
vim.keymap.set("n", "<leader>ppp", "<cmd>e ~/.config/nvim/lua/jmaxwell/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", "<cmd>nohl<CR>")

-- [[ Source current file ]]
--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
