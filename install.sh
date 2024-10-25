
for_each_src_dest() {
    "$@" init.el ~/.cache/emacs/vanilla/home-emacs-dot-d/init.el
    "$@" nvim ~/.config/nvim

    "$@" bash-and-zsh/dot-bashrc.bash ~/.bashrc
    "$@" bash-and-zsh/dot-zshrc.zsh ~/.zshrc

    "$@" tangled/mpv.conf ~/.config/mpv/mpv.conf
    "$@" tangled/profile.d-01-all.sh ~/.config/profile.d/01-all.sh
    "$@" tangled/tmux.conf ~/.config/tmux/tmux.conf
    "$@" tangled/bspwmrc ~/.config/bspwm/bspwmrc
    "$@" tangled/bspwm-theme ~/.local/bin/bspwm-theme
    "$@" tangled/dot-xinitrc ~/.xinitrc
    "$@" tangled/dot-Xresources ~/.Xresources
    "$@" tangled/dot-Xresources ~/.Xdefaults
}

ln_full_path() { ln -sv "$PWD/$1" "$2"; }
rm_dest() { rm -fv "$2"; }

case "$1" in
    (ln) for_each_src_dest ln_full_path ;;
    (rm) for_each_src_dest rm_dest ;;
    (*) echo "$0 ln   or   $0 rm" >&2 ; exit 1 ;;
esac
