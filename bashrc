#!/bin/bash

source $HOME/.vagrantrc/bashrc
PATH="$PATH:/Applications/GitX.app/Contents/Resources"
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
export CDPATH=".:/Users/daniel.heath/Projects/rea::/Users/daniel.heath/Projects"
export EDITOR="subl -w -n"

. `brew --prefix`/etc/profile.d/z.sh

