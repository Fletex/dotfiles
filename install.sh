#!/bin/bash

PWD=`pwd`

python3 ./install.py install

ln -sf $PWD/local_xinit  $HOME/.xinit_local
ln -sf $PWD/xinitrc      $HOME/.xinitrc
ln -sf $PWD/muttrc       $HOME/.muttrc
ln -sf $PWD/tarsnaprc    $HOME/.tarsnaprc
ln -sf $PWD/tmux.conf    $HOME/.tmux.conf
ln -sf $PWD/bashrc       $HOME/.bashrc
ln -sf $PWD/bash_profile $HOME/.bash_profile
ln -sf $PWD/vimrc        $HOME/.vimrc

if [[ "$1" = "-a" ]]; then
    # Initialize Vundle
    if [[ ! -d ~/.vim/bundle/Vundle.vim ]]
    then
      git clone 'https://github.com/VundleVim/Vundle.vim.git' \
        ~/.vim/bundle/Vundle.vim
      vim -c PluginInstall -c qa
    fi

    # Update Vundle
    vim -c PluginUpdate -c qa
fi

[[ -f install_private.zsh ]] && source install_private.zsh
