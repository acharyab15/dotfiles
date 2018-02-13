"==================================
" Vundle
"==================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set the runtime path to include my-snippets
set rtp+=~/.vim/my-snippets/

call vundle#begin()"

" Vundle plugins here
Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle
Plugin 'tmhedberg/SimpylFold' " handle Vim's crazy folding
Plugin 'vim-scripts/indentpython.vim' "conform to PEP8 indentation
"Make sure any trailing whitespace is highlighted and deleted
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jnurmine/Zenburn' "colors
Plugin 'altercation/vim-colors-solarized' "colors
Plugin 'scrooloose/nerdtree' "NERDTree
Plugin 'jistr/vim-nerdtree-tabs' "To use nerdtree tabs
Plugin 'tpope/vim-commentary' "For comments
Plugin 'kien/ctrlp.vim' "Search for anything with VIM
Plugin 'tpope/vim-fugitive' "Git commands in VIM
Plugin 'vim-airline/vim-airline' "Awesome tabline for vim
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter' "git diff in the sign column ('gutter')
Plugin 'SirVer/ultisnips' "Snippets plugin
Plugin 'honza/vim-snippets' "get default snippets
Plugin 'w0rp/ale' "async linting
Plugin 'maralla/completor.vim' "Async completion

"Python plugin
Plugin 'davidhalter/jedi-vim' "jedi autocompletion library

" All Plugins must be added before the following line
call vundle#end()            " required

"==================================
" VIM Basic Setup
"==================================
set nocompatible              " required
filetype off                  " required
"" Cleanup whitespace on save (work with vim-better-whitespace)
autocmd BufEnter * EnableStripWhitespaceOnSave

"==================================
" Colors
"==================================
" Which scheme to use based on VIM mode
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>") "switch between dark and light solarized
syntax enable          " enable syntax processing

"==================================
" Spaces & Tabs
"==================================
au BufNewFile,BufRead *.py
    \ set tabstop=4     "VIM uses this many spaces to show <TAB>
    \ set softtabstop=4 "number of spaces inserted when hit <TAB>
    \ set shiftwidth=4  "<TAB> becomes 'insert four spaces'
    \ set textwidth=79  "line under 80 characters
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix "so that no conversion issues
"==================================
" UI Config
"==================================
set number             " show line numbers
set showcmd            " show command in bottom bar
filetype indent on     " load filetype-specific indent files
set wildmenu           " graphical/visual autocomplete for command menu
set lazyredraw         " redraw only when we need to
set showmatch          " highlight matching [{(_}]
set clipboard=unnamed  " access system clipboard

"==================================
" Splitting screens
"==================================
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>   " ctrl-j move to split below
nnoremap <C-K> <C-W><C-K>   " ctrl-k move to split above
nnoremap <C-L> <C-W><C-L>   " right
nnoremap <C-H> <C-W><C-H>   " left

"==================================
" Searching
"==================================
set incsearch          " search as characters are entered
set hlsearch           " highlight matches

" turn off search highligh
nnoremap <leader><space> :nohlsearch<CR>

"==================================
" Movement
"==================================

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

"=================================
" Leader Shortcuts
"=================================

let mapleader=","            "leader is comma


"================================
"Python specific
"================================
" Make code look pretty
let python_highlight_all=1
syntax on
set encoding=utf-8 "UTF8 when working with Python

"================================
" VIM airline config
"================================
let g:airline#extensions#tabline#enabled = 1 "enable the extension
let g:airline#extensions#tabline#left_sep = ' ' "straight tabs??
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default' "path formatter

"================================
" UltiSnips config
"================================
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"===============================
" Vim completor config
"===============================
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
