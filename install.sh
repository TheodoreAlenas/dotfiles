
for_each() {
    "$@" emacs/init.el ~/.emacs.d/init.el
    "$@" emacs/distort-font.el ~/.emacs.d/my-pkg/distort-font.el
    "$@" emacs/theme-list.el ~/.emacs.d/my-pkg/theme-list.el
    "$@" nvim ~/.config/nvim

    "$@" bash-and-zsh/dot-bashrc.bash ~/.bashrc
    "$@" bash-and-zsh/dot-zshrc.zsh ~/.zshrc

    "$@" other/mpv.conf ~/.config/mpv/mpv.conf
    "$@" other/profile.d-01-all.sh ~/.config/profile.d/01-all.sh
    "$@" other/tmux.conf ~/.config/tmux/tmux.conf
    "$@" other/bspwmrc ~/.config/bspwm/bspwmrc
    "$@" other/bspwm-theme ~/.local/bin/bspwm-theme
    "$@" other/dot-xinitrc ~/.xinitrc
    "$@" other/dot-Xresources ~/.Xresources
    "$@" other/dot-Xresources ~/.Xdefaults
}

mkdir_p() { mkdir -p "${2%/*}"; }
ln_full_path() { ln -sv "$PWD/$1" "$2"; }
rm_dest() { rm -fv "$2"; }

case "$*" in
    (mkdir) for_each mkdir_p ;;
    (ln) for_each ln_full_path ;;
    (rm) for_each rm_dest ;;
    (*) echo "$0 mkdir|ln|rm" >&2 ; exit 1 ;;
esac
