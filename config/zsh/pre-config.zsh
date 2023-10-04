ZDOTDIR=~/.config/zsh

HISTFILE=~/.cache/zsh/history
HISTSIZE=128
SAVEHIST=1024

ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# by including dashes in there, they're also considered words
WORDCHARS=''
backward-word() zle .$WIDGET  # WIDGET is "backward-word" here
forward-word() zle .emacs-forward-word
zle -N backward-word
zle -N forward-word
set -o emacs

setopt interactive_comments

autoload -U colors && colors
function paint_ps1() {
    if ! [[ $PS1 =~ % ]]
    then PS1="%{$fg[green]%}$PS1%{$reset_color%}"
    fi
}

