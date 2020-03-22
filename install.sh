#!/bin/bash

PWD=`pwd`

python3 ./install.py install-apt
python3 ./install.py install-user-config

ln -sf $PWD/tarsnaprc    $HOME/.tarsnaprc
ln -sf $PWD/mailcap      $HOME/.mutt/mailcap

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
