function ll { ls -al "$@" ; }

function be { bundle exec "$@" ; }
function ber {
  bundle exec rake "$@" ;
}
function feeling-lucky { git pull --rebase && ber && gps "$@" ; }
alias wtf='echo "last exit was $?"; uname -m -p -r -s && echo "You are `whoami`, logged into `hostname`" && pwd'
function ga { git add "$@" ; }
function gc { git commit "$@" ; }
function gco { git checkout "$@" ; }
function gd { git diff --color --word-diff "$@" ; }
function gl { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative "$@" ; }
function gs { git status "$@" ; }
function gss { git stash save "$@" ; }
function gsp { git stash pop "$@" ; }
function gpl { git pull --rebase "$@" ; }
function gps { git push "$@" ; }

function tenTimes
{
for i in {1..10}; do $@; echo "Result was "$?; done
}

function eachDir
{
retval=0
for D in *; do
    if [ -d "${D}" ]; then
        cd "${D}"
        "$@"
        retval=`expr $retval + $?`
        cd ..
    fi
done
echo "Sum or exit codes: $retval"
bash -c "exit $retval"
}

function syntax
{
  find * -iname *.rb | xargs -n 1 ruby -c
}

function cleanwhiteboardpic
{
  convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
}
