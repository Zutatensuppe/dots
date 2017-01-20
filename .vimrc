


"# Vundle 
"# -------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'posva/vim-vue'

Plugin 'ctrlpvim/ctrlp.vim'

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






"# Options for CTRLP
" --------------------------------------------------

" ignore files in .gitignore 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']




"# General
"# -------------------------------------------------

set relativenumber
set number
syntax on
color molokai
filetype on
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab




"# Remapping
"# -------------------------------------------------

" for non-ergodox keyboard, remap jj to esc
inoremap jj <Esc>

" for easy switch between splits
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"let mapleader = ","
"nmap <leader>ne :NERDTreeToggle<cr>



"# Enabling Syntax complete 
"# -------------------------------------------------

filetype plugin on
set omnifunc=syntaxcomplete#Complete



"# Go back to last caret when reopening a file
"# -------------------------------------------------

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal! g'\"" | endif
  au Syntax * syntax sync fromstart
endif



