" ~~~ VIM-PLUG ~~~
" ~~~~~~~~~~~~~~~~
if has("unix")
  " https://github.com/junegunn/vim-plug#unix-linux
  call plug#begin('~/.local/share/nvim/plugged')
endif
if has("win32")
  " https://github.com/junegunn/vim-plug#windows-powershell-1
  call plug#begin('~/AppData/Local/nvim/plugged')
endif

" LSP & CMP
" https://github.com/neovim/nvim-lspconfig
" https://github.com/hrsh7th/nvim-cmp/
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'glepnir/lspsaga.nvim'

" Telescope
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" https://github.com/fatih/vim-go/wiki/Tutorial
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'airblade/vim-gitgutter'

if executable('tmux')
  Plug 'wellle/tmux-complete.vim'
  Plug 'christoomey/vim-tmux-navigator' " Requires changes in ~/.tmux.conf
  Plug 'tmux-plugins/vim-tmux-focus-events' " Fixes gutter refreshing in tmux
endif

Plug 'vimwiki/vimwiki'

"" Themes -> https://vimcolorschemes.com/
"Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'


call plug#end()


" ~~~ LUA CONFIGS ~~~
" ~~~~~~~~~~~~~~~~~~~
lua << EOF
local cmp = require'cmp'

  cmp.setup({
    --snippet = {
    --  -- REQUIRED - you must specify a snippet engine
    --  expand = function(args)
    --    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    --  end,
    --},
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    completion = {
      autocomplete = false,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- npm install -g typescript typescript-language-server
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['gopls'].setup{
    capabilities = capabilities
  }

  --local saga = require'lspsaga'
  --saga.init_lsp_saga()
EOF

lua <<EOF
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")
EOF


" ~~~ GENERAL ~~~
" ~~~~~~~~~~~~~~~
filetype plugin indent on
syntax enable
set title
set history=5000
set undolevels=5000
set number
set relativenumber
set signcolumn=yes
set hidden
set autoread
set autowrite
set wildmenu
set showcmd
set splitbelow
set splitright
set clipboard+=unnamedplus
set noshowmode
set scrolloff=8
set mouse=

if has("unix")
  set undodir=~/.config/nvim/undodir
endif
if has("win32")
  set undodir=~/AppData/Local/nvim/undodir
endif

set undofile


" ~~~ SEARCHING ~~~
" ~~~~~~~~~~~~~~~~~
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set inccommand=nosplit


" ~~~ FORMATTING ~~~
" ~~~~~~~~~~~~~~~~~~
set backspace=indent,eol,start
set listchars=eol:⚬,tab:▸▸,trail:␣
set list
set ruler
set wrap linebreak
set colorcolumn=81
highlight colorcolumn ctermbg=darkgray
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab


" ~~~ GO SPECIFIC ~~~
" ~~~~~~~~~~~~~~~~~~~
augroup go
    au FileType go set noexpandtab
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>r <Plug>(go-rename)
    autocmd FileType go nmap <leader>i <Plug>(go-info)
    autocmd FileType go nmap <leader>I <Plug>(go-implements)
    autocmd FileType go nmap <leader>d <Plug>(go-def-vertical)
    autocmd FileType go nmap <leader>D <Plug>(go-describe)
    autocmd FileType go nmap <leader>? <Plug>(go-doc)
    autocmd FileType go nmap <leader>?? <Plug>(go-doc-browser)
    autocmd FileType go nmap <leader>c <Plug>(go-referrers)
    autocmd FileType go nmap <leader>C <Plug>(go-callstack)
    autocmd FileType go nmap <leader>p <Plug>(go-channel-peers)
augroup END

let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_addtags_transform = "camelcase"

let g:go_highlight_types = 1


" ~~~ TS/JS SPECIFIC ~~~
" ~~~~~~~~~~~~~~~~~~~~~~
augroup ts
augroup END

" ~~~ MAKE SPECIFIC ~~~
" ~~~~~~~~~~~~~~~~~~~~~
augroup make
    autocmd FileType make setlocal noexpandtab
augroup END


" ~~~ APPEARANCE / THEMES ~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~
set termguicolors
set background=dark
colorscheme everforest
let g:everforest_background = 'medium' "hard, medium, or soft
set laststatus=2
set showtabline=2
let g:lightline = {'colorscheme': 'everforest'}
let g:lightline.tabline = {'left': [['buffers']], 'right': [['bufnum']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
hi! link Search PMenu
hi! link IncSearch PMenuSel
hi! Normal     ctermbg=NONE guibg=NONE
hi! LineNr     ctermbg=NONE guibg=NONE
hi! SignColumn ctermbg=NONE guibg=NONE
hi! VertSplit ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! EndOfBuffer ctermbg=NONE guibg=NONE


" ~~~ NAVIGATION MAPPINGS ~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Wrapped lines
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" Buffers
nnoremap <A-h> :bp<CR>
nnoremap <A-l> :bn<CR>
" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Quickfix Menu
nnoremap <C-Right> :cnext<CR>
nnoremap <C-Left> :cprevious<CR>
nnoremap <C-Down> :cclose<CR>
nnoremap <C-Up> :copen<CR>


" ~~~ LEADER MAPPINGS ~~~
" ~~~~~~~~~~~~~~~~~~~~~~~
:let mapleader=","
" Clear highlighting
:map <leader>, :nohl<CR>
" Save current vim session
":map <leader>s :mksession<CR>
" Toggle absolute/relative line numbers
:map <leader>nn :call ToggleLineNumbering()<CR>
" Close all but current window
"map <leader>k :%bd|e#<CR>
" Quick switch between last two buffers
:map <leader><Tab> <C-^>


" ~~~ OMNI COMPLETION ~~~
" ~~~~~~~~~~~~~~~~~~~~~~~
inoremap <C-Space> <C-x><C-o>
set completeopt=longest,menu,menuone,noinsert,noselect


" ~~~ OTHER MAPPINGS ~~~
" ~~~~~~~~~~~~~~~~~~~~~~
:map <F4> :call ToggleSpellChecking()<CR>
nmap <F3> i<C-R>=strftime('# %Y-%m-%d #')<CR><CR><Esc>
imap <F3> <C-R>=strftime('# %Y-%m-%d #')<CR><CR>


" ~~~ FUNCTIONS ~~~
" ~~~~~~~~~~~~~~~~~
function! ToggleLineNumbering()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

function! ToggleSpellChecking()
  if(&spell ==1)
    set nospell
  else
    set spell spelllang=en_us
  endif
endfunc


" ~~~ PLUG-INS / 3RD PARTY ~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~ LSP ~~~
"nnoremap <leader>sd :lua vim.lsp.buf.definition()<CR>
"nnoremap <leader>si :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>ssh :lua vim.lsp.buf.signature_help()<CR>
"nnoremap <leader>srr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.hover()<CR>
"nnoremap <leader>sca :lua vim.lsp.buf.code_action()<CR>
"nnoremap <leader>ssd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>n :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>p :lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <leader>sll :call LspLocationList()<CR>


" ~~~ Telescope ~~~
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fs :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fa :lua require('telescope.builtin').lsp_code_actions()<CR><ESC>
nnoremap <leader>fr :lua require('telescope.builtin').lsp_references()<CR><ESC>
nnoremap <leader>fd :lua require('telescope.builtin').lsp_definitions()<CR><ESC>
nnoremap <leader>fi :lua require('telescope.builtin').lsp_implementations()<CR><ESC>

" ~~~ LSP Saga ~~~
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"nnoremap <silent><leader>ca :Lspsaga code_action<CR>
"vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

" ~~~ NERD Tree ~~~
map <C-n> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=40
" Automatically open NERDTree if vim opened a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1
  \ && isdirectory(argv()[0])  && !exists("s:std_in")
  \ | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if NERDTree is the only buffer with data on quit
autocmd bufenter * if (winnr("$") == 1
  \ && exists("b:NERDTree") && b:NERDTree.isTabTree())
  \ | q | endif

" ~~~ Git Gutter ~~~
" Update gitgutter on save
autocmd BufWritePost * GitGutter

" ~~~ Vimwiki ~~~
let g:vimwiki_list = [
      \ {'path': '/Volumes/GoogleDrive/My Drive/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
  \]
" Only treat .md files in the wiki directory as vimwiki files
"let g:vimwiki_global_ext = 0

" ~~~ Ripgrep ~~~
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob\ '!.git'
  command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Rg<space>
endif

