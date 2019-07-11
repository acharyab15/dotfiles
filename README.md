# dotfiles

# VIM


A lot of good stuff from [this](https://www.fullstackpython.com/vim.html) page for python/VIM integration

[Vim as a Go IDE](https://octetz.com/posts/vim-as-go-ide) has an awesome tutorial for setting up VIM for Golang development using the Language Server Protocol(LSP) based [Conqueror of Completion](https://github.com/neoclide/coc.nvim) as the completion tool.

The `.vimrc_go` file on this repo contains a minimalist vimrc (in terms of plugins) that only has two plugins -- vim-go and coc -- for a very fast Golang development in Go. It does have some basic setups that I like in my VIM environment but nothing to slow down VIM.

### Some simple, yet amazing key mappings

`map 0 ^`     Remap VIM 0 to first non-blank character

`nmap <leader>w :w!<cr>`        Fast saving with just two keystrokes       
`map <leader>bd :Bclose<cr>:tabclose<cr>gT`       Close the current buffer    
`map <leader>ba :bufdo bd<cr>`        Close all the buffers   
`map <leader>l :bnext<cr>`       Go to next buffer   
`map <leader>h :bprevious<cr>`        Go to previous buffer   

# Tools for improvement


[bat](https://github.com/sharkdp/bat) -- better than cat.   
[fzf](https://github.com/junegunn/fzf) -- fuzzy file finder on terminal.   
htop    
