"================================
" Vundle
"================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" set the runtime path to include my-snippets
set rtp+=~/.vim/my-snippets/

call vundle#begin()"

" Vundle plugins here
Plugin 'gmarik/Vundle.vim'  " let Vundle manage Vundle
Plugin 'jnurmine/Zenburn' "colors
Plugin 'altercation/vim-colors-solarized' "colors
Plugin 'tpope/vim-commentary' "For comments
Plugin 'airblade/vim-gitgutter' "git diff in the sign column ('gutter')
Plugin 'mileszs/ack.vim' "use ack or ag for vim
Plugin 'kien/ctrlp.vim' "Search for anything with VIM
Plugin 'tpope/vim-fugitive' "Git commands in VIM
Plugin 'vim-airline/vim-airline' "Awesome tabline for vim
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'SirVer/ultisnips' "Snippets plugin
" Plugin 'honza/vim-snippets' "get default snippets
Plugin 'klen/python-mode' "make vim amazing
Plugin 'davidhalter/jedi-vim' "jedi autocompletion library
"++++++++++++++++++++++++++++++++++++++
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
"--------------------------------------
Plugin 'christoomey/vim-tmux-navigator' "navigate between vim panes and tmux splits
"======================================
Plugin 'leafgarland/typescript-vim' "typescript highlighting
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'Quramy/tsuquyomi'
"======================================
Plugin 'mattn/emmet-vim' "html for vim
"========================================
" Plugins used previously that might
" not be necessary after python-mode
Plugin 'w0rp/ale' "async linting
" Plugin 'maralla/completor.vim' "Async completion
" Plugin 'vim-scripts/indentpython.vim' "conform to PEP8 indentation
" Make sure any trailing whitespace is highlighted and deleted
" Plugin 'ntpeters/vim-better-whitespace'
" Python plugin

" Plugin 'tmhedberg/SimpylFold' " handle Vim's crazy folding
" Plugin 'ntpeters/vim-better-whitespace'
" All Plugins must be added before the following line
call vundle#end()            " required

"================================
" VIM Basic Setup
"================================
set nocompatible              " required
set noswapfile
set autoread
set backspace=indent,eol,start " fix backspace indent 
set hidden			" for saving undo
filetype off                  " required
set foldmethod=marker
"" Cleanup whitespace on save (work with vim-better-whitespace)
call pathogen#infect()
call pathogen#helptags()


"" Set undo directory at vim_temp for multi session undo
set undodir=/Users/acharyab/.vim_temp
set undofile
"================================
" Colors
"================================
" Which scheme to use based on VIM mode
if has('gui_running')
set background=dark
colorscheme solarized
else
colorscheme zenburn
endif

call togglebg#map("<F5>") "switch between dark and light solarized
syntax enable          " enable syntax processing
autocmd ColorScheme * highlight StatusLine ctermbg=darkgray cterm=NONE guibg=darkgray gui=NONE

"================================
" Spaces & Tabs
"================================
au BufNewFile,BufRead *.py, *.cpp, *.hpp
    \ set tabstop=4     "VIM uses this many spaces to show <TAB>
    \ set softtabstop=4 "number of spaces inserted when hit <TAB>
    \ set shiftwidth=4  "<TAB> becomes 'insert four spaces'
    \ set textwidth=79  "line under 80 characters
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix "so that no conversion issues
"================================
" UI Config
"================================
set number relativenumber             " show line numbers relative to the current line
" hybrid line numbers 
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set showcmd            " show command in bottom bar
filetype indent on     " load filetype-specific indent files
filetype plugin indent on "load filetype-specific indent files
set wildmenu           " graphical/visual autocomplete for command menu
set lazyredraw         " redraw only when we need to
set showmatch          " highlight matching [{(_)}]
set clipboard=unnamed  " access system clipboard
set mouse=a	       " enable mouse

"================================
" Splitting screens
"================================
set splitbelow "natural splitting
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>   " ctrl-j move to split below
nnoremap <C-K> <C-W><C-K>   " ctrl-k move to split above
nnoremap <C-L> <C-W><C-L>   " right
nnoremap <C-H> <C-W><C-H>   " left
"================================
" Searching
"================================
set incsearch          " search as characters are entered
set hlsearch           " highlight matches
set smartcase
set ignorecase

" better paste
xnoremap p pgvy

" Remap VIM 0 to first non-blank character
map 0 ^

"================================
" Movement
"================================

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

"================================
" Leader Shortcuts
"================================
let mapleader=","            "leader is comma
nnoremap <leader><space> :nohlsearch<CR> "turn off search highlight
nmap <leader>w :w!<cr>        " Fast saving
map <leader>bd :Bclose<cr>:tabclose<cr>gT "Close the current buffer
map <leader>ba :bufdo bd<cr>  "Close all the buffers
map <leader>l :bnext<cr>  " Go to next buffer
map <leader>h :bprevious<cr> " Go to previous buffer
" ==============================
" Abbreviations
" ==============================
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
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
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"===============================
" Vim completor config
"===============================
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"===============================
" Ack settings 
"===============================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" don't jump to first result and map
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"===============================
" Python-mode config
"===============================
let g:pymode_python = 'python3' "python 3 syntax checking
let g:pymode_trim_whitespaces = 1 "trim unused whitespaces
let g:pymode_indent = 1 "PEP8-compatible python indent
let g:pymode_lint_todo_symbol = '!!'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


"===============================
" Go configurations
"===============================
let g:go_fmt_command = "goimports"     "format with goimports insstead of gofmt
" let g:go_fmt_autosave = 0            "disable fmt on save
set autowrite			       
map <C-n> :cnext<CR>		       "jump between errors in quickfix list
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" represent single tab as 4 spaces
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

let g:go_version_warning=0
let g:go_metalinter_enabled=1
let g:go_metalinter_autosave=1
