set nocompatible              " be iMproved, required
filetype off                  " required
set ts=4 sw=4
set number
set sessionoptions+=globals
let mapleader = ' '
nmap <silent> <leader>a v<Plug>(coc-codeaction-selected)

let g:snipMate = { 'snippet_version' : 1 }
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Make the Pmenu not gross
highlight Pmenu ctermfg=253 ctermbg=234 guifg=#eaeaea guibg=#424242
highlight PmenuSel ctermfg=234 ctermbg=253 guifg=#424242 guibg=#eaeaea
highlight PmenuSbar ctermfg=253 ctermbg=234 guifg=#eaeaea guibg=#424242
highlight PmenuThumb ctermfg=234 ctermbg=253 guifg=#424242 guibg=#eaeaea

" autocmd ColorScheme * highlight CocHighlightText     ctermfg=LightMagenta    guifg=LightMagenta
:highlight CocInlayHint ctermfg=235 ctermbg=14

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" New 2023 Summer
" Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jeetsukumaran/vim-buffergator'
"""""""""""""""""""""""""""""""
Plugin 'neoclide/coc.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
" TRYING COC Plugin 'dense-analysis/ale'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
"
" START NERD TREE PLUGINS
"
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'PhilRunninger/nerdtree-visual-selection'
"
" END NERD TREE PLUGINS
"

let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'java'
Plugin 'mbledkowski/neuleetcode.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
:set number relativenumber
:set nu rnu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
