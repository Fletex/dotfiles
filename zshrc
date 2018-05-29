#!/usr/bin/zsh
# vim: ft=zsh

autoload -U promptinit
promptinit

autoload -U compinit
compinit

setopt extendedglob notify
setopt autocd

export GPG_TTY=`tty`

#pass config/sh-wechall

zstyle ':completion:*' menu select=2

if [[ "`uname`" = "Linux" ]]; then
    alias ls='ls --color'
else
    alias ls='colorls'
fi
alias ffmpeg='ffmpeg -hide_banner'
alias whois='whois -H'
alias gg='gdb -q'
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
alias www='sftp 192.168.178.15:/var/www/nhtdocs/www'

prompt bart
