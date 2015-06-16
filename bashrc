#!/bin/bash

source $HOME/.vagrantrc/bashrc
export CDPATH=".:/Users/daniel.heath/Projects/rea::/Users/daniel.heath/Projects"
export EDITOR=editor

GPG_TTY=`tty`
export GPG_TTY

. `brew --prefix`/etc/profile.d/z.sh

