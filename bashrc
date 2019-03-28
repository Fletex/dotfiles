#!/bin/bash

alias 010='~/.010editor/010editor'
alias 7z='7z -bd'
alias cpptags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'
alias ffmpeg='ffmpeg -hide_banner'
alias fpl='firefox -no-remote --profile .'
alias gdb='gdb -q'
alias gs='git log --oneline -3 && git status'
alias l='ls -la'
alias la='ls -la'
alias objdump='objdump -Mintel'
alias qr="qrencode -o - -t UTF8"
alias sss='sudo systemctl suspend'
alias t='tmux new-session -t main'
alias whois='whois -H'
alias www='sftp 192.168.1.1:pub'
alias ymp3='youtube-dl --extract-audio --audio-format mp3'

if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
