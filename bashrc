#!/bin/bash

source $HOME/.vagrantrc/bashrc
PATH="$HOME/.rvm/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin":/usr/local/bin:$PATH # Add RVM and `subl` to PATH
PATH="$PATH:/Applications/GitX.app/Contents/Resources"
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
export CDPATH=".:/Users/daniel.heath/Projects/rea::/Users/daniel.heath/Projects"
export EDITOR="subl -w -n"

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

