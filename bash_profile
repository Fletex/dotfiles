#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=de_DE.UTF-8

export AWT_TOOLKIT=XToolkit
export GDK_BACKEND=wayland

export BROWSER=firefox
export EDITOR="vim"
export PATH=$HOME/bin:/usr/share/clang:$PATH

ulimit -c unlimited

setxkbmap -option caps:hyper us

if [ -z "$SSH_AGENT_PID" ];
then
 eval `ssh-agent -s`
 #ssh-add < /dev/null
fi
