# License at the bottom
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
