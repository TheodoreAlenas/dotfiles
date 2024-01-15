
for_each_src_dest() {
    for f in c/*; do "$@" "$f" ~/.config/"${f#c/}"; done
    for f in dot/*; do "$@" "$f" ~/."${f#dot/}"; done
    for f in doom-emacs/*; do "$@" "$f" ~/.cache/emacs/doom/"${f#doom-emacs/}"; done
    "$@" dot/Xresources ~/.Xdefaults
    "$@" init.el ~/.cache/emacs/vanilla/home-emacs-dot-d/init.el
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
