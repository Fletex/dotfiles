#!/bin/sh

ulimit -c unlimited

xset s off -dpms
xset r rate 200 30

setxkbmap -option caps:hyper us
sh $HOME/.screenlayout/`hostname -s`.sh
xrandr --dpi 120

if [ -z "$SSH_AGENT_PID" ];
then
 eval `ssh-agent -s`
 #ssh-add < /dev/null
fi

unset LC_ALL
#export LANG=de_DE.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=de_DE.UTF-8

#export CVSROOT="anoncvs@ftp.hostserver.de:/cvs"

#if grep -q 'Elan Touchpad' <(xinput); then
#    xinput set-prop "Elan Touchpad" "Synaptics Finger" 5 10 50
#    xinput set-prop "Elan Touchpad" "Synaptics Tap Action" 2 3 0 0 1 3 2
#fi

redshift -l 52.2:9.5 &

echo "Starting at $(date)" >> ~/.logs/i3logfile-$$
exec /usr/bin/i3 >> ~/.logs/i3logfile-$$
