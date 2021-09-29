#!/bin/sh

ulimit -c unlimited

xset -dpms
xset s off 
xset r rate 200 30

setxkbmap -option caps:hyper us
sh $HOME/.screenlayout/`hostname -s`.sh
xrandr --dpi 120
xrdb .Xresources

if [ -z "$SSH_AGENT_PID" ];
then
 eval `ssh-agent -s`
 #ssh-add < /dev/null
fi

unset LC_ALL
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=de_DE.UTF-8

# WM=openbox-session
WM=xmonad

mkdir -p /tmp/org
# compton &
# stalonetray &
# gromit-mpx &
# feh --bg-fill ~/wallpaper.png

dropbox start &

exec dbus-launch --sh-syntax --exit-with-session $WM
