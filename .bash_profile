source ~/kube-prompt.sh

function prompt
{
local WHITE="\[\033[1;37m\]"
local GREEN="\[\033[0;32m\]"
local CYAN="\[\033[0;36m\]"
local GRAY="\[\033[0;37m\]"
local BLUE="\[\033[0;34m\]"
local RED="\[\033[1;31m\]"
export PS1="${RED}__________      | ${BLUE}\w ${WHITE} |  => "
export PS2="| => "
}
prompt

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color


export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

alias qfind="find . -name "                 # qfind:    Quickly search for file

#   ---------------------------
#   NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

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
alias .2='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias c='clear'                             # c:            Clear terminal display
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
kubexec() {
	kubectl exec -ti $(kubectl get pods | awk ' { print $1 } ' | grep "$1") bash
}
alias gg=lazygit
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'



export PATH="/usr/local/bin/python3:$PATH"

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"


# # added by Anaconda3 5.0.1 installer
# export PATH="/anaconda3/bin:$PATH"

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/acharyab/google-cloud-sdk/path.bash.inc' ]; then source '/Users/acharyab/google-cloud-sdk/path.bash.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/acharyab/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/acharyab/google-cloud-sdk/completion.bash.inc'; fi


#NVM stuff
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
