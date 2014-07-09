#!/bin/bash

source $HOME/.vagrantrc/bashrc
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
export CDPATH=".:/Users/daniel.heath/Projects/rea::/Users/daniel.heath/Projects"
export EDITOR="subl -w -n"

GPG_TTY=`tty`
export GPG_TTY

. `brew --prefix`/etc/profile.d/z.sh

