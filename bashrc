#!/bin/bash

source /etc/skel/.bashrc

ulimit -c unlimited

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES=C
export LC_TIME=de_DE.UTF-8
export BROWSER=firefox
export EDITOR="vim"

function br()
{
  echo "$1" | sudo tee /sys/class/backlight/*/brightness
}

stm32_env()
{
  # export PREFIX=arm-bare_newlib_cortex_m3_nommu-eabi
  # export CROSS_COMPILE=${PREFIX}-
  # export PATH="/home/fh/x-tools/$PREFIX/bin:$PATH"
  export PATH="/home/fh/x-tools/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"
  export PLATFORM=bluepill
  export OOCD_INTERFACE=stlink-v2
  alias stm32_openocd='openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg'
}

chromium_env()
{
  export PATH="/home/fh/git/depot_tools:$PATH"
  export BOARD="octopus"

  alias flashrom_read="sudo $HOME/git/flashrom/flashrom -p raiden_debug_spi:target=AP -r"
}

barcode_pdf()
{
  barcode -b "$1" -o /tmp/barcode.ps
  ps2pdf /tmp/barcode.ps /tmp/barcode.pdf
  mupdf /tmp/barcode.pdf
}

export PATH="$PATH:$HOME/.local/bin:/sbin"

alias 7z='7z -bd'
alias ffmpeg='ffmpeg -hide_banner'
alias fpl='firefox -no-remote --profile .'
alias gdb='gdb -q'
alias gs='git log --oneline -3 && git status'
alias l='ls -la'
alias la='ls -la'
alias objdump='objdump -Mintel'
alias qr="qrencode -o - -t UTF8"
alias sss='sudo systemctl suspend'
alias whois='whois -H'
alias ymp3='youtube-dl --extract-audio --audio-format mp3'
alias ll='ls -li'
alias mpv='mpv --x11-netwm=yes'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

[ $TERM = "xterm" ] && TERM=xterm-256color
