#!/bin/sh
set -exu

PWD=`pwd`

ln -sf $PWD/tarsnaprc    $HOME/.tarsnaprc
mkdir -p $HOME/.xmonad
ln -sf $PWD/xmonad.hs $HOME/.xmonad/
ln -sf $PWD/xmobarrc $HOME/.xmobarrc
ln -sf $PWD/Xresources $HOME/.Xresources
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/hushlogin $HOME/.hushlogin
ln -sf $PWD/tmux.conf $HOME/.tmux.conf
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/xinitrc $HOME/.xinitrc
