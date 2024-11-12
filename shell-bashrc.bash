# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# I have no idea what this does
[[ $DISPLAY ]] && shopt -s checkwinsize

. ~/.local/bin/posix-shell-startup.sh
PS1="(bash) $PS1"

bashrc_compl=/usr/share/bash-completion/bash_completion
test -r "$bashrc_compl" && . "$bashrc_compl"

set -o emacs
