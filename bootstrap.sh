#!/bin/bash

set -e

if [[ -x /usr/bin/sudo ]]
then
	git clone https://github.com/Fletex/dotfiles ~/dotfiles

	bash ~/dotfiles/install.sh -a
else
	apt update
	apt install git sudo

	gpasswd -a $LOGNAME sudo
	echo "Please reboot"
fi
