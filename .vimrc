"----------------------
""" Setup
"----------------------

"don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
 filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" help with vim's crazy fold
Plugin 'tmhedberg/SimpylFold'
" autoindent across multiple lines to conform to PEP8 standards
" Plugin 'vim-scripts/indentpython.vim'
" Zenburn for terminal mode color
Plugin 'jnurmine/Zenburn'
" Solarized for GUI mode
Plugin 'altercation/vim-colors-solarized'
" File tree
Plugin 'scrooloose/nerdtree'
" Use tabs"
Plugin 'jistr/vim-nerdtree-tabs'
" Search for anything from VIM using Ctrl-P
Plugin 'kien/ctrlp.vim'
" Git commands without leaving VIM
Plugin 'tpope/vim-fugitive'
" Powerline status bar (virtualenv, git branch, files being edited"
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" All Plugins must be added before the following line
Plugin 'tpope/vim-commentary'                 " To make comments easier
Plugin 'vim-airline/vim-airline'              " Great looking status bar!
Plugin 'vim-airline/vim-airline-themes'       " Themes for that great looking status bar
Plugin 'airblade/vim-gitgutter'               " Put git information to the left of line numbers
Plugin 'vim-scripts/grep.vim'                 " Search for stuff from inside vim
Plugin 'ntpeters/vim-better-whitespace'       " Make sure any trailing whitespace is highlighted and deleted
Plugin 'Raimondi/delimitMate'                 " Auto-close quotes, parens, brackets, etc
Plugin 'sheerun/vim-polyglot'                 " Language pack for syntax, compiler, indentation, etc
Plugin 'flazz/vim-colorschemes'               " Gotta look good!
Plugin 'vimwiki/vimwiki'                      " Take notes
Plugin 'christoomey/vim-tmux-navigator'       " tmux is better
Plugin 'w0rp/ale'                             " Async linting and completion
Plugin 'maralla/completor.vim'                " Async completion
Plugin 'tmux-plugins/vim-tmux-focus-events'   " Work nice with tmux inactive panes
Plugin 'blueyed/vim-diminactive'              " Work nice with tmux inactive panes

call vundle#end()            " required

" Access system clipboard
set clipboard=unnamed
" Turn vim on on your shell
" # TODO: need to figure this out
" set editing-mode vi

" Hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

"" Cleanup whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave

" vim-airline
let g:airline_theme = 'solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
" toggle colors dark/light by pressing F5
call togglebg#map("<F5>")

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"" Turn on syntax highlighting
let python_highlight_all=1
syntax on

"" For plugins to load correctly
 filetype plugin indent on

""Pick a leader key
let mapleader = ","

" " Security
set modelines=0

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

set number  "Show line numbers

set ruler "Show file stats
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup             " vim doesn't write backup or swap files
set noswapfile

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" " Blink cursor on error instead of beeping (grr)
" set visualbell "don't beep
set title                " change the terminal's title
set mouse=a  "enable mouse
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb " more utf-8 encoding goodness
set binary " this way you can edit binary files -- because you know, binary
set ttyfast " stop everything from scrolling so dang slow

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"" Avoid extraneous whitespace
" highlight BadWhitespace ctermbg=red guibg=darkred
"" VIM flags it and removes
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"" Whitespace
 set wrap
 set formatoptions=tcqrn1

"" Tabs
au BufNewFile,BufRead *.py
            \ set tabstop=4 "tabs are equal to 4 spaces
            \ set shiftwidth=4 "number of spaces to use for autoindenting
            \ set softtabstop=4
            \ set textwidth=79
            \ set expandtab "turns tab characters into spaces
            \ set noshiftround
            \ set autoindent
            \ set fileformat=unix

" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldlevel=99
nnoremap <space> za     " enable folding with spacebar
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
" }}}
"" Cursor motion
 set scrolloff=3
set backspace=indent,eol,start
 set matchpairs+=<:> " use % to jump between pairs
 runtime! macros/matchit.vim
"
" " Move up/down editor lines
nnoremap j gj
nnoremap k gk
"
"" Allow hidden buffers
 set hidden

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
" " Rendering
set ttyfast

" Vim switches to paste mode, removing formatting
set pastetoggle=<F2>

"" Status bar always
 set laststatus=2
"
" " Last line
 set showmode
 set showcmd

"" Searching
" nnoremap / /\v
" vnoremap / /\v
 set hlsearch "highlight search terms
 set incsearch "show search matches as I type
 set ignorecase "ignore case when searching
 set smartcase "ignore case if search pattern is all lowercase,
               "case-sensitive otherwise
 set showmatch "set show matching parenthesis
nmap <silent> ,/ :nohlsearch<CR>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

