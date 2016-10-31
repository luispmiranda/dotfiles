"luispmiranda .vimrc configs"
filetype off
syntax on

set nocompatible            " old vi compatibility
set ruler                   " show the cursor position all the time
set autoindent              
set list                    " show $ at the end of the line
set smartindent
set smarttab
set showmatch
set hlsearch
set number
set mouse=a
set cursorline
set colorcolumn=120
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab
set ff=unix
set encoding=utf-8
set ignorecase
set smartcase
set laststatus=2

"""""""""""" VUNDLE PLUGINS

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

Plugin 'tomasr/molokai'                    " molokai color scheme
Plugin 'altercation/vim-colors-solarized'  " solarized color scheme

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'isRuslan/vim-es6'

Plugin 'ctrlpvim/ctrlp.vim'                " ctrlp fuzzy finder

call vundle#end()

" buffer navigation
map gl :bn<cr>
map gh :bp<cr>
map gd :bd<CR>
map gb :ls<CR>

"""""""""""" NERDTree
map <C-n> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeWinPos="left"

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""" COLOR SCHEME
syntax enable
colorscheme Molokai
set guifont=Monaco:h20

"""""""""""" AIRLINE
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
"let g:airline#extensions#tabline#fnamemod = ':t'
" Workaround for leaving insert mode delay with statusline active
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"""""""""""" CTRL.P

" setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
