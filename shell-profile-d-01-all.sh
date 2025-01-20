export GOPATH=~/.local/share/go
export GOBIN=~/.local/share/go/bin
export PYENV_ROOT=~/.pyenv

# sourcing this file multiple times won't lengthen $PATH
export AL_PATH_FROM_ROOT="${AL_PATH_FROM_ROOT:-"$PATH"}"
PATH=
al_path_push () { PATH="${PATH:+$PATH:}$1"; }

al_path_push ~/.local/bin
al_path_push ~/.local/share/nvim/mason/bin
al_path_push "$GOBIN"
al_path_push "$PYENV_ROOT/versions/3.6.15/bin"
al_path_push "$AL_PATH_FROM_ROOT"

export PATH

# on demand, do pyenv init - >/tmp/pyenvinit && . /tmp/pyenvinit

export EDITOR=nvim
export DEFAULT_TERM=alacritty
