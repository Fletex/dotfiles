#!/usr/bin/zsh
# vim: ft=zsh

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
 #   zgen load /path/to/super-secret-private-plugin

#    # bulk load
#    zgen loadall <<EOPLUGINS
#        zsh-users/zsh-history-substring-search
#        /path/to/local/plugin
#EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi


function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

export PATH=$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib/:$LD_LIBRARY_PATH

export PS1="%n@%m $PS1"
export BROWSER=firefox

#autoload -U promptinit && promptinit
#autoload -U compinit && compinit
#
#setopt extendedglob notify
#setopt autocd

export GPG_TTY=`tty`
#pass config/sh-wechall

#zstyle ':completion:*' menu select=2

if [[ "`uname`" = "Linux" ]]; then
    alias ls='ls --color'
    export PATH="/usr/lib/ccache/bin/:$PATH"
else
    alias ls='colorls'
fi
alias ffmpeg='ffmpeg -hide_banner'
alias whois='whois -H'
alias gdb='gdb -q'
alias objdump='objdump -Mintel'
alias gs='git log --oneline -3 && git status'
alias qr="qrencode -o - -t UTF8"
alias 7z='7z -bd'
alias l='ls -la'
alias v='virsh -c qemu+ssh://fhadmin@nas/system'
alias l='ls -l'
alias la='ls -la'
alias t='tmux new-session -t main'
alias sss='sudo systemctl suspend'
alias fpl='firefox -no-remote --profile .'
alias 010='~/.010editor/010editor'
alias www='sftp 192.168.1.1:pub'
