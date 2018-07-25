#!/bin/sh

ulimit -c unlimited

xset s off -dpms
xset r rate 200 30

#xrdb -merge $HOME/.Xresources
setxkbmap -option caps:hyper us
sh $HOME/.screenlayout/`hostname -s`.sh

if [ -z "$SSH_AGENT_PID" ];
then
 eval `ssh-agent -s`
 #ssh-add < /dev/null
fi

if grep -q 'Elan Touchpad' <(xinput); then
    xinput set-prop "Elan Touchpad" "Synaptics Finger" 5 10 50
    xinput set-prop "Elan Touchpad" "Synaptics Tap Action" 2 3 0 0 1 3 2
fi

slstatus &
exec dwm
