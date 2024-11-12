
for_each() {
    all_editor "$@"
    all_but_editor "$@"
}
all_but_editor() {
    all_shell "$@"
    all_scmd "$@"
    all_x11 "$@"
    all_other "$@"
}

all_editor() {
    "$@" emacs-init.el ~/.emacs.d/init.el
    "$@" emacs-distort-font.el ~/.emacs.d/my-pkg/distort-font.el
    "$@" emacs-theme-list.el ~/.emacs.d/my-pkg/theme-list.el
    "$@" nvim ~/.config/nvim
}
all_shell() {
    "$@" shell-bashrc.bash ~/.bashrc
    "$@" shell-zshrc.zsh ~/.zshrc
    "$@" shell-posix-rc.sh ~/.local/bin/posix-shell-startup.sh
    "$@" shell-profile-d-01-all.sh ~/.config/profile.d/01-all.sh
}
all_scmd() {
    f=scmd.sh     ; "$@" $f ~/.local/bin/$f
    f=scmd_log.py ; "$@" $f ~/.local/bin/$f
    f=scmd_bar.py ; "$@" $f ~/.local/bin/$f
    f=scmd_big.sh ; "$@" $f ~/.local/bin/$f
}
all_x11() {
    "$@" win-bspwmrc ~/.config/bspwm/bspwmrc
    "$@" win-bspwm-theme ~/.local/bin/bspwm-theme
    "$@" win-xinitrc ~/.xinitrc
    "$@" win-Xresources ~/.Xresources
    "$@" win-Xresources ~/.Xdefaults
}
all_other() {
    "$@" other-mpv.conf ~/.config/mpv/mpv.conf
    "$@" other-tmux.conf ~/.config/tmux/tmux.conf
}
all_under_other() {
    all_x11 "$@"
    all_other "$@"
}

do_mkdir() { mkdir -pv "${2%/*}"; }
do_ln_full_path() { ln -sv "$PWD/$1" "$2"; }
do_rm_dest() { rm -fv "$2"; }
do_test_src() { test -e "$1" || echo "missing $1"; }

for_each="${for_each:-for_each}"

for arg; do
    case "$arg" in
        (noed) for_each=all_but_editor ;;
        (mkdir) $for_each do_mkdir ;;
        (ln) $for_each do_ln_full_path ;;
        (rm) $for_each do_rm_dest ;;
        (test) $for_each do_test_src ;;
        (*) echo "Usage: $0 ARG... ARG=noed|mkdir|ln|rm" >&2 ; exit 1 ;;
    esac
done
