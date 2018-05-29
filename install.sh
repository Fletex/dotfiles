#!/usr/bin/env zsh

PWD=`pwd`
mac=`(ifconfig egress || ip link) 2> /dev/null | awk '/ether / || /lladdr/ {print $2}' | tail -n1`

#[[ ! -f "local_$mac" ]] && echo -n "#!/usr/bin/zsh\n" > "local_$mac"
#ln -sf $PWD/local_$mac $HOME/.xinit_local

ln -sf $PWD/local_xinit $HOME/.xinit_local
ln -sf $PWD/Xresources  $HOME/.Xresources
ln -sf $PWD/muttrc      $HOME/.muttrc
#ln -sf $PWD/gitconfig   $HOME/.gitconfig
ln -sf $PWD/tarsnaprc   $HOME/.tarsnaprc
ln -sf $PWD/tmux.conf   $HOME/.tmux.conf
ln -sf $PWD/xinitrc     $HOME/.xinitrc
ln -sf $PWD/zshenv      $HOME/.zshenv
ln -sf $PWD/zshrc       $HOME/.zshrc
ln -sf $PWD/vimrc       $HOME/.vimrc
ln -sf $PWD/i3status    $HOME/.i3status.conf
ln -sf $PWD/known_hosts $HOME/.ssh/known_hosts

mkdir -p                $HOME/.config/i3
ln -sf $PWD/i3          $HOME/.config/i3/config
mkdir -p                $HOME/.config/i3blocks
ln -sf $PWD/i3blocks    $HOME/.config/i3blocks/config

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
    fi

    # Update Vundle
    vim -c PluginUpdate -c qa
fi

source install_private.zsh

