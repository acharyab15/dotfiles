# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/acharyab/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws colorize pip python brew osx zsh-syntax-highlighting zsh-autosuggestions tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# ----------------------------------
# MAKE TERMINAL BETTER
# ----------------------------------
alias cp='cp -iv'                           # cp verbose, -i overrides previous -n
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias v='vim'
alias p='python3'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias .2='cd ../../'                        # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cl='clear;ls'                             # c:            Clear terminal display
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
gcm () { git commit -am "$1"; }
grm () { git rm -f "$1"; }
alias gs='git status'
alias gp='git pull'
alias gh='git push'
alias ga='git add'
alias gfo='git fetch origin'
alias cat='bat'
alias top='htop'
alias gohome='cd ~/go/src/'
alias kgap='watch kubectl get po --all-namespaces'
alias kgp='watch kubectl get po'
alias mod='export GO111MODULE=on'
alias gopath='cd $GOPATH'

[[ -s "/Users/acharyab/.gvm/scripts/gvm" ]] && source "/Users/acharyab/.gvm/scripts/gvm"
export PATH=/usr/local/bin:$PATH

# Kube PS1 to get current kubernetes config
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export PS1='$(kube_ps1)'$PS1

# Intel VINO environment variables
# source /opt/intel/openvino/bin/setupvars.sh
export HOMEBEW_GITHUB_API_TOKEN=95cac7d771e786cf235ff4c41fa08e95cf2cb068
# Enabling Postgres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# Add pipenv to path
export PATH=$PATH:/Users/acharyab/Library/Python/3.7/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# # added by Anaconda3 5.0.1 installer
# export PATH="/anaconda3/bin:$PATH"

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/acharyab/google-cloud-sdk/path.bash.inc' ]; then source '/Users/acharyab/google-cloud-sdk/path.bash.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/acharyab/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/acharyab/google-cloud-sdk/completion.bash.inc'; fi


#NVM stuff
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

# Adding bash completion to iterm
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/bison/bin:$PATH"
