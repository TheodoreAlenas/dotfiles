relink() {
    (cd_and_relink "$@")
}

cd_and_relink() {
    cd "$1" || return 1
    for f in ./*
    do rm -fv "$2/$f" && ln -sv "$PWD/$f" "$2/$f"
    done
}

relink config ~/.config
relink bin ~/.local/bin
relink home ~/.config
