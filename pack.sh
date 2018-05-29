#!/bin/sh


AR="`pwd`/tgz/`date +%F`.tgz"

cd ~
tar -cvf $AR .ssh/known_hosts .ssh/config aliases git/dotfiles/install_private.zsh
