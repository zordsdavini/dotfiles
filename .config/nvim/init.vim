""" NeoVim config by <zordsdavini@arns.lt>, 2023 (30.34)
" a lot of taken from Optixal

""" Vim-Plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

" Core
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'phaazon/hop.nvim'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" PHP

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'

call plug#end()


""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=130
set noswapfile
set mouse+=a
set hidden
set number
" set relativenumber             " Show relative line numbers

autocmd BufEnter * let &titlestring = "[ViM] " . fnamemodify(v:this_session, ':t') . " " . @%
set title


""" Coloring
set colorcolumn=80,130
colorscheme gruvbox
set termguicolors

syntax on



""" Filetype-Specific Configurations
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2


""" Core plugin configuration (vim)

" auto-pairs
let g:AutoPairsShortcutToggle = ''

" nvim-cmp
set completeopt=menu,menuone,noselect

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw = 1

" rainbow_parentheses
let g:rainbow_active = 1

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.icon_pinned = '📌'


""" Custom Mappings (vim) (lua custom mappings are within individual lua config files)

" Core

let mapleader='\'

cnoreabbrev wq w<bar>bd
cnoreabbrev q bd

" Clipboard functionality (paste from system)
vnoremap  <leader>y "+y
nnoremap  <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap  <leader>s :source $MYVIMRC<CR>
nnoremap  <leader>e :e $MYVIMRC<CR>

nmap <A-1> :NvimTreeToggle<CR>
map <leader>r :NvimTreeFindFile<cr>

nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>

nnoremap gcc <Plug>NERDCommenterToggle
vnoremap gcc <Plug>NERDCommenterToggle

" hop motion
map <leader>\w <cmd>HopWord<cr>
omap <leader>\w <cmd>HopWord<cr>
map <leader>\b <cmd>HopWordBC<cr>
omap <leader>\b <cmd>HopWordBC<cr>
map <leader>\j <cmd>HopLineStart<cr>
omap <leader>\j <cmd>HopLineStart<cr>
map <leader>\/ <cmd>HopPattern<cr>
omap <leader>\/ <cmd>HopPattern<cr>

" barbar
nnoremap <silent> <A-Left> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-Right> <Cmd>BufferNext<CR>
nnoremap <silent> <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A->> <Cmd>BufferMoveNext<CR>
nnoremap <silent> <A-p> <Cmd>BufferPick<CR>
nnoremap <silent> <C-p> <Cmd>BufferPin<CR>

" Telescope mappings
nnoremap <leader>\ <cmd>Telescope find_files<cr>
nnoremap <leader>] <cmd>Telescope git_files<cr>
nnoremap <leader>[ <cmd>Telescope git_status<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>] <cmd>Telescope buffers<cr>
nnoremap <F1> <cmd>Telescope help_tags<cr>

""" Core plugin configuration (lua)
lua << EOF
require('treesitter-config')
require('nvim-cmp-config')
require('lspconfig-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('diagnostics')
require('hop-config')

require'hop'.setup()
EOF
