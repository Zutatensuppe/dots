export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;6m\]\w\[\033[00m\]\$ '

alias '..=cd ..'
alias 'l=ls -la'

export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi
