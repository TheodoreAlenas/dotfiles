# License at the bottom

main() {
    case "$1" in
        (-d)
            with_desktops echo
            per_rule echo
            ;;
        ('')
            with_desktops bspc monitor -d || return 1
            per_rule bspc_rule_remove_add || return 1
            ;;
        (*)
            echo "bspwm desktop and rules reset, -d dry runs"
            ;;
    esac
}

with_desktops() {
    "$@" main web manual terminal media spotify temporary
}

per_rule() {
    # Class (middle) is the first of the 2 WM_CLASS fields of xprop.
    # The second of the 2 WM_CLASS fields goes to the first of these.
    "$@" 'Battery widget:*:*' state=floating focus=off
    "$@"   'Clock widget:*:*' state=floating focus=off
    "$@"        'Zathura:*:*' state=tiled
    "$@"          '*:emacs:*' state=tiled
}

bspc_rule_remove_add() {
    bspc rule --remove "$1"
    bspc rule --add "$@"
}

main "$@" || exit 1
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

