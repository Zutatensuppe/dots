


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

Plugin 'L9'

Plugin 'FuzzyFinder'

Plugin 'scrooloose/nerdtree'

Plugin 'mileszs/ack.vim'

Plugin 'nelsyeung/twig.vim'


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




"# Make paste go into paste mode automatically
" ----------------------------------------------------
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction




"# Options for CTRLP
" --------------------------------------------------

" ignore files in .gitignore 
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|cache\|uploads'




"# General
"# -------------------------------------------------

set relativenumber
set number
syntax on
colorscheme solarized
set background=dark
filetype on
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set wildmenu
set wildmode=longest:full,full
set laststatus=2

set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'


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

let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
nmap <Leader>ss :Ack 

nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>


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


"# Make clear what active split is by hiding 
"# colorcolumn on winleave
"# -------------------------------------------------
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END
