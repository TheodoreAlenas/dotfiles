
for_each_src_dest() {
    "$@" m/dot-xinitrc ~/.xinitrc
    "$@" m/dot-Xresources ~/.Xresources
    "$@" m/dot-Xresources ~/.Xdefaults
    "$@" m/profile-dot-d-exports.sh ~/.config/profile.d/01-all.sh
    "$@" init.el ~/.cache/emacs/vanilla/home-emacs-dot-d/init.el
    "$@" nvim ~/.config/nvim

    "$@" bash-and-zsh/dot-bashrc.bash ~/.bashrc
    "$@" bash-and-zsh/dot-zshrc.zsh ~/.zshrc

    "$@" m/tmux.conf ~/.config/tmux/tmux.conf
    "$@" m/tmux-fzf-new-session ~/.local/bin/tmux-fzf-new-session

    "$@" m/bspwmrc ~/.config/bspwm/bspwmrc
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
