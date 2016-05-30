#!/bin/bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export SRCPATH=$HOME/projects

if [ -e /Volumes/Code ]; then
export SRCPATH=/Volumes/Code
fi

for i in $HOME/dotfiles/bashrc.d/* ; do
    source "$i"
done
