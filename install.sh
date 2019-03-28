#!/bin/bash

PWD=`pwd`
mac=`(ifconfig egress || ip link) 2> /dev/null | awk '/ether / || /lladdr/ {print $2}' | tail -n1`

#[[ ! -f "local_$mac" ]] && echo -n "#!/usr/bin/zsh\n" > "local_$mac"
#ln -sf $PWD/local_$mac $HOME/.xinit_local

ln -sf $PWD/local_xinit $HOME/.xinit_local
ln -sf $PWD/muttrc      $HOME/.muttrc
ln -sf $PWD/tarsnaprc   $HOME/.tarsnaprc
ln -sf $PWD/tmux.conf   $HOME/.tmux.conf
ln -sf $PWD/xinitrc     $HOME/.xinitrc
ln -sf $PWD/bashrc      $HOME/.bashrc
ln -sf $PWD/vimrc       $HOME/.vimrc
ln -sf $PWD/i3status    $HOME/.i3status.conf

mkdir -p                $HOME/.config/sway
ln -sf $PWD/sway        $HOME/.config/sway/config
mkdir -p                $HOME/.config/waybar
ln -sf $PWD/waybar      $HOME/.config/waybar/config
mkdir -p                $HOME/.config/swaylock
ln -sf $PWD/swaylock    $HOME/.config/swaylock/config
mkdir -p                $HOME/.config/termite
ln -sf $PWD/termite     $HOME/.config/termite/config

rm -f $HOME/.config/i3blocks/blocks
[[ -f /usr/bin/apt ]]    && ln -s /usr/share/i3blocks $HOME/.config/i3blocks/blocks
[[ -f /usr/bin/pacman ]] && ln -s /usr/lib/i3blocks   $HOME/.config/i3blocks/blocks

if [[ "$1" = "-a" ]]; then
    # Initialize Vundle
    if [[ ! -d ~/.vim/bundle/Vundle.vim ]]
    then
      git clone 'https://github.com/VundleVim/Vundle.vim.git' \
        ~/.vim/bundle/Vundle.vim
      vim -c PluginInstall -c qa
      git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
    fi

    # Update Vundle
    vim -c PluginUpdate -c qa
fi

[[ -f install_private.zsh ]] && source install_private.zsh
