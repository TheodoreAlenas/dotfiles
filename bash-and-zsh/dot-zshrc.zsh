
function zshrc_main() {
    zshrc_set_variables
    zshrc_set_emacs_movement
    zshrc_load_everything_unrelated_to_color
    zshrc_prepare_colors
    zshrc_set_color_scheme
}

function zshrc_set_variables() {
    ZDOTDIR=~/.config/zsh

    HISTFILE=~/.cache/zsh/history
    HISTSIZE=128
    SAVEHIST=1024

    ZSH_AUTOSUGGEST_STRATEGY=(completion history)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

    setopt interactive_comments
}

function zshrc_set_emacs_movement() {

    # by including dashes in there, they're also considered words
    WORDCHARS=''

    backward-word() zle .$WIDGET  # WIDGET is "backward-word" here
    forward-word() zle .emacs-forward-word
    zle -N backward-word
    zle -N forward-word
    set -o emacs
}

autoload -U colors && colors
function zshrc_set_ps1_painted() {
    if ! [[ $PS1 =~ % ]]
    then PS1="%{$fg[green]%}$PS1%{$reset_color%}"
    fi
}

function zshrc_load_everything_unrelated_to_color() {
    autoload -U compinit && compinit
    source ~/.local/lib/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/p/c/bash-and-zsh/posix-shell-startup.sh
}

function zshrc_prepare_colors() {
    add-zsh-hook precmd zshrc_set_ps1_painted
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
}

function zshrc_set_color_scheme() {
    ZSH_HIGHLIGHT_STYLES[default]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[assign]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[path]=fg=cyan,bold

    ZSH_HIGHLIGHT_STYLES[command]=fg=blue
    ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue,bold

    ZSH_HIGHLIGHT_STYLES[redirection]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[comment]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green

    ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=red
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=red
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=red
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=red
}

zshrc_main
