# dotfiles

# vimrc

A lot of good stuff from this page for python/VIM integration --https://www.fullstackpython.com/vim.html

# Some simple, yet amazing key mappings

`map 0 ^`     Remap VIM 0 to first non-blank character

`nmap <leader>w :w!<cr>`        Fast saving with just two keystrokes       
`map <leader>bd :Bclose<cr>:tabclose<cr>gT`       Close the current buffer    
`map <leader>ba :bufdo bd<cr>`        Close all the buffers   
`map <leader>l :bnext<cr>`       Go to next buffer   
`map <leader>h :bprevious<cr>`        Go to previous buffer   

# Tools for improvement

[bat][https://github.com/sharkdp/bat] -- better than cat. 
[fzf][https://github.com/junegunn/fzf] -- fuzzy file finder on terminal. 
htop  

# acd\_func.sh
-- extends bash's CD to keep, display and access history of visited directory names

A script which defines a CD replacement function in order to keep, display and access history of visited directories. Normally the script will be sourced at the end of .bashrc.

cd --

Shows the history list of visited directories. The list shows the most recently visited names on the top.

This command is also assigned to ctrl+w.

cd -NUM

Changes the current directory with the one at position NUM in the history list. The directory is also moved from this position to the top of the list.

AUTHOR
version 1.0.5,  10-nov-2004
written by Petar Marinov
this script is public domain

To install the modified CD function, copy acd\_func.sh to any directory in your $PATH, or even your home directory. At the end of your .bashrc add source acd\_func.sh. Restart your bash session and then type cd --.
