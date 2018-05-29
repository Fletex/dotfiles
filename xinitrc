#!/bin/sh

ulimit -c unlimited

xset s off -dpms
xset r rate 200 30

xrdb -merge $HOME/.Xresources
setxkbmap -option caps:hyper
sh $HOME/.screenlayout/`hostname -s`.sh

#xsetroot -solid black
urxvtd -q -o -f

if [ -z "$SSH_AGENT_PID" ];
then
 eval `ssh-agent -s`
 ssh-add < /dev/null
fi

# Now in i3
##if [ -f "$HOME/.xinit_local" ]; then
##    source "$HOME/.xinit_local"
##fi

#urxvtc -e sh -c "tmux attach || tmux"
exec i3
#exec mate-session
