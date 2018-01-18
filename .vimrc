"----------------------
""" Setup
"----------------------

"don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
 filetype on 

"" TODO: Load plugins here (pathogen or vundle)

"" Turn on syntax highlighting
 syntax on

"" For plugins to load correctly
 filetype plugin indent on

""Pick a leader key
let mapleader = ","

" " Security
set modelines=0

set number  "Show line numbers

set ruler "Show file stats

" " Blink cursor on error instead of beeping (grr)
" set visualbell

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb " more utf-8 encoding goodness
set binary " this way you can edit binary files -- because you know, binary
set ttyfast " stop everything from scrolling so dang slow

"" Whitespace
 set wrap
 set textwidth=79
 set formatoptions=tcqrn1

"" Tabs
set tabstop=4 "tabs are equal to 4 spaces
set shiftwidth=4 "4 spaces for auto shfts
set softtabstop=0
set expandtab "turns tab characters into spaces
 set noshiftround

"" Cursor motion
 set scrolloff=3
set backspace=indent,eol,start
 set matchpairs+=<:> " use % to jump between pairs
 runtime! macros/matchit.vim
"
" " Move up/down editor lines
" nnoremap j gj
" nnoremap k gk
"
"" Allow hidden buffers
 set hidden

" " Rendering
set ttyfast

"" Status bar always
 set laststatus=2
"
" " Last line
 set showmode
 set showcmd
"
" " Searching
" nnoremap / /\v
" vnoremap / /\v
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase
 set showmatch
" map <leader><space> :let @/=''<cr> " clear search
"
" " Remap help key.
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>
"
" " Textmate holdouts
"
" " Formatting
" map <leader>q gqip
"
" " Visualize tabs and newlines
" set listchars=tab:▸\ ,eol:¬
" " Uncomment this to enable by default:
" " set list " To enable by default
" " Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


"
" " Color scheme (terminal)
 set t_Co=256
 set background=dark
 let g:solarized_termcolors=256
 let g:solarized_termtrans=1
" "  put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" " in ~/.vim/colors/ and uncomment:
 " colorscheme Solarized
