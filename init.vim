" Piboy314's Neovim config

" Nvim specific settings
set exrc
set mouse=a
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set termguicolors
set number
set updatetime=50
set ignorecase

" Plugins
call plug#begin("~/.vim/plugged")

Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-eunuch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'navarasu/onedark.nvim'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'windwp/windline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'andweeb/presence.nvim'
"Plug 'xiyaowong/nvim-transparent'

call plug#end()

" Set colourscheme and transparency
let g:onedark_config = {
    \ 'style': 'dark',
\}
colorscheme onedark
"highlight Normal guibg=none

lua require'nvim-tree'.setup {}

" Remaps
let mapleader = " "

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>tp :Telescope<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fs :Telescope current_buffer_fuzzy_find<CR>
nnoremap ' :NvimTreeToggle<CR>

" Custom functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Custom autogroup
augroup PIBOY314
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Lua
lua <<EOF

require('wlsample.wind')

require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    highlight = {enable = true},
    indent = {enable = true}
}

require('onedark').setup  {
    transparent = true
}

require('onedark').load()

EOF
