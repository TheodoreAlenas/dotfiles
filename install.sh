
for_each_src_dest() {
    for f in doom-emacs-for-temporary-symlink/*
    do "$@" "$f" ~/.cache/emacs/doom/"${f#*/}"
    done

    "$@" m/dot-xinitrc ~/.xinitrc
    "$@" m/dot-Xresources ~/.Xresources
    "$@" m/dot-Xresources ~/.Xdefaults
    "$@" init.el ~/.cache/emacs/vanilla/home-emacs-dot-d/init.el
    "$@" nvim ~/.config/nvim

    "$@" bash-and-zsh/dot-bashrc.bash ~/.bashrc
    "$@" bash-and-zsh/dot-zshrc.zsh ~/.zshrc

    "$@" m/tmux.conf ~/.config/tmux/tmux.conf
    "$@" m/tmux-fzf-new-session ~/.local/bin/tmux-fzf-new-session

    "$@" m/bspwmrc ~/.config/bspwm/bspwmrc
    "$@" m/bspwm-rules ~/.local/bin/bspwm-rules
}

ln_full_path() { ln -sv "$PWD/$1" "$2"; }
rm_dest() { rm -fv "$2"; }
relink() { rm_dest "$@" && ln_full_path "$@"; }

case "$1" in
    (--help|-h) echo "$0 [ARG]   where ARG one of ln, rm, --help, -h" ;;
    (ln) for_each_src_dest ln_full_path ;;
    (rm) for_each_src_dest rm_dest ;;
    ('') for_each_src_dest relink ;;
esac
