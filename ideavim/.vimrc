set rnu
set mouse=
let mapleader = " "

Plug 'tpope/vim-commentary'
set vim-commentary

map <Leader>ff <action>(com.mituuz.fuzzier.Fuzzier)
map <Leader>mf <action>(com.mituuz.fuzzier.FuzzyMover)
map <Leader>gf <action>(com.mituuz.fuzzier.FuzzierVCS)
map <leader>i <action>(QuickJavaDoc)
map <leader>u <action>(ShowIntentionActions)
map <leader>c <action>(GotoAction)

" Opens edit files menu
map <leader>m :action com.ofya.jvroom.actions.EditFilesAction<CR>
" Adds a file to the list
map <leader>a :action com.ofya.jvroom.actions.AddFileAction<CR>
" Open the files 1 through 5
map <leader>1 :action com.ofya.jvroom.actions.openfile.OpenFileAction0<CR>
map <leader>2 :action com.ofya.jvroom.actions.openfile.OpenFileAction1<CR>
map <leader>3 :action com.ofya.jvroom.actions.openfile.OpenFileAction2<CR>
map <leader>4 :action com.ofya.jvroom.actions.openfile.OpenFileAction3<CR>
map <leader>5 :action com.ofya.jvroom.actions.openfile.OpenFileAction4<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
