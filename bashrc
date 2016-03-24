#!/bin/bash

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export SRCPATH=/Volumes/Code

for i in $HOME/dotfiles/bashrc.d/* ; do
    source "$i"
done
