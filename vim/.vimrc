let mapleader = ' '

set background=dark
colorscheme slate

set number relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent

set nowrap

nmap <Leader>w :windo set wrap!<cr>
nmap <Leader>vd :vertical diffsplit
nmap <Leader>hd :diffsplit

nmap <Leader>od :Ex<cr>

nmap N Nzz
nmap n nzz

""" Move content selected in visual up and down
vmap K :m'<-2<CR>gv=gv
vmap J :m'>+1<CR>gv=gv

""" Replace current word
nmap <Leader>r :%s/\<<C-R><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>


""" Paste and delete into void buffer
xmap <Leader>p "_dP
nmap <Leader>d "_d
vmap <Leader>d "_d
