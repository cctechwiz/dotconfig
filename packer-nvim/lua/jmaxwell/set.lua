vim.opt.guicursor = ""

vim.opt.clipboard = "unnamedplus"

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.laststatus = 3

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
if (vim.loop.os_uname().sysname == "Linux") then
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
elseif (vim.loop.os_uname().sysname == "Darwin") then
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
else
  vim.opt.undodir = os.getenv("LOCALAPPDATA") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
--vim.opt.listchars = {eol = "⚬", tab = "▸▸", trail = "␣"}
vim.opt.listchars = { tab = "▸▸", trail = "␣" }
