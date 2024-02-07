
for_each_src_dest() {
    "$@" init.el ~/.cache/emacs/vanilla/home-emacs-dot-d/init.el
    "$@" nvim ~/.config/nvim

    "$@" bash-and-zsh/dot-bashrc.bash ~/.bashrc
    "$@" bash-and-zsh/dot-zshrc.zsh ~/.zshrc

    "$@" m/dot-xinitrc ~/.xinitrc
    "$@" m/dot-Xresources ~/.Xresources
    "$@" m/dot-Xresources ~/.Xdefaults

    "$@" m/tangled/mpv.conf ~/.config/mpv/mpv.conf
    "$@" m/tangled/profile.d-01-all.sh ~/.config/profile.d/01-all.sh
    "$@" m/tangled/tmux.conf ~/.config/tmux/tmux.conf
    "$@" m/tangled/tmux-fzf-new-session ~/.local/bin/tmux-fzf-new-session
    "$@" m/tangled/bspwmrc ~/.config/bspwm/bspwmrc
    "$@" m/tangled/bspwm-theme ~/.local/bin/bspwm-theme
}

ln_full_path() { ln -sv "$PWD/$1" "$2"; }
rm_dest() { rm -fv "$2"; }
relink() { rm_dest "$@" && ln_full_path "$@"; }

case "$1" in
    (ln) for_each_src_dest ln_full_path ;;
    (rm) for_each_src_dest rm_dest ;;
    ('') for_each_src_dest relink ;;
    (*) echo "$0   or   $0 ln   or   $0 rm" >&2 ; exit 1 ;;
esac
