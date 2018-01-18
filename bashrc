#!/bin/bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export SRCPATH=$HOME/projects

if [ -e /Volumes/Code ]; then
export SRCPATH=/Volumes/Code
fi

cat "$HOME"/dotfiles/bashrc.d/* > "$HOME/dotfiles/bashrc.concatenated"
source $HOME/dotfiles/bashrc.concatenated
