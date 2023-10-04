# Got to symlink to ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# I have no idea what this does
[[ $DISPLAY ]] && shopt -s checkwinsize

. /home/aleena/.config/posix-shell-startup.sh
PS1="(bash) $PS1"

# shellcheck disable=SC1090
source_if_exists() {
    [ -r "$1" ] && . "$1"
}
source_if_exists /usr/share/bash-completion/bash_completion

set -o emacs

