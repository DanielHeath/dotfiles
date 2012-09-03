#!/bin/bash
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
export EDITOR="vi"

source `dirname "$BASH_SOURCE"`/bash_aliases

if which defaults > /dev/null 2>&1 ; then
  defaults write com.apple.finder AppleShowAllFiles TRUE
fi

if [ "$PS1" ]; then

  red='\[\e[31m\]'
  green='\[\e[32m\]'
  yellow='\[\e[33m\]'
  cyan='\[\e[36m\]'
  grey='\[\e[0;37m\]'

  reset_color='\[\e[0m\]'
  set_title='\[\e]0;\]\H:\w\[\007\]'

  prompt="$green$"

  if test `id -un` = root; then
    prompt="$red#"
  fi

  function prompt-git-user() {
    git_user=`git config --get user.name`
    if test -n "$git_user"; then
      echo " '$git_user'"
    fi
  }

  function prompt-git-branch() {
    git_branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* //'`
    if test -n "$git_branch"; then
      echo " [$git_branch]"
    fi
  }

  function prompt-git-rebasing() {
    [[ -d .git/rebase-apply ]] && echo " REBASING"
  }

  function boxname() {
    echo "(`hostname | cut -d'.' -f1`) "
  }

  # create a $fill of all screen width minus the time string and a space:
  let fillsize=${COLUMNS}-12
  fill=""
  while [ "$fillsize" -gt "0" ]
  do
  fill="-${fill}" # fill with underscores to work on
  let fillsize=${fillsize}-1
  done

	PS1="${set_title}${fill}
\$(boxname)${green}(\t) ${yellow}\w${grey}\$(prompt-git-branch)${red}\$(prompt-git-rebasing)${cyan}\$(prompt-git-user) ${yellow}\$RUBY_VERSION
${prompt} ${reset_color}"

fi

test -e $HOME/projects && export CDPATH=$CDPATH:.:$HOME/projects/atlas:$HOME/projects/toolkit:$HOME/projects:$HOME/Library/Application\ Support/TextMate/Bundles
test -e $HOME/projects && export PATH=$PATH:$HOME/projects/toolkit/pairing_station/:$HOME/projects/toolkit/deployment_tools/bin:$HOME/projects/:/usr/local/share/npm/bin:$HOME/bin:/usr/local/bin

export RUBYOPT=rubygems
export RUBYLIB=.
export BUNDLER_EDITOR=vi

# Ensure that postgres databases are created with the right collation
LC_ALL=en_US.UTF-8
LC_LANG=en_US.UTF-8
export LC_ALL LC_LANG
