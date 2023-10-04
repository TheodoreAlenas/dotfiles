# License at the bottom
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

# Copyright (c) 2023 Dimakopoulos Theodoros
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
