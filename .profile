if [ "$TERM" == "xterm" ]; then
  # No it isn't, it's gnome-terminal
  export TERM=xterm-256color
fi

if [ -n "$DISPLAY" ]; then
  xset b off
  xset s noblank
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[38;5;6m\]\w\[\033[00m\]\$ '
export LS_COLORS=$LS_COLORS:'di=36:'

alias '..=cd ..'
alias 'l=ls -la'
alias 'mux=tmux -2 attach || tmux -2 new'
alias 'vi=vim';

export VISUAL=vim
export EDITOR="$VISUAL"

# set editing-mode vi
set -o vi

# bind "jj":vi-movement-mode # remap escape

. ~/git-completion.bash

export _JAVA_AWT_WM_NONREPARENTING=1

