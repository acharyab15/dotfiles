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

"" Whitespace
 set wrap
 ""set textwidth=79
 set formatoptions=tcqrn1

"" Tabs
set tabstop=4 "tabs are equal to 4 spaces
set shiftwidth=4 "number of spaces to use for autoindenting
set softtabstop=0
set expandtab "turns tab characters into spaces
 set noshiftround
" Folding {{{
"=== folding ===
set foldmethod=marker   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
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

" " Color scheme (terminal)
 set t_Co=256
 set background=dark
 let g:solarized_termcolors=256
 let g:solarized_termtrans=1
" "  put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" " in ~/.vim/colors/ and uncomment:
 " colorscheme Solarized
 
 
 " vim:foldmethod=marker:foldlevel=0

 " Execute this for syntastic
execute pathogen#infect()

" Configurations for syntastic (don't know what they do yet)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
