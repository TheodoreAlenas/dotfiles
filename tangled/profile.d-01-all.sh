GOPATH=~/.local/share/go
GOBIN=~/.local/share/go/bin

# sourcing this file multiple times won't lengthen $PATH
export AL_PATH_FROM_ROOT="${AL_PATH_FROM_ROOT:-"$PATH"}"
AL_PATH_1=~/.local/bin
AL_PATH_2=~/.local/share/nvim/mason/bin
export PATH="$AL_PATH_1:$AL_PATH_2:$GOBIN:$AL_PATH_FROM_ROOT"

export EDITOR=nvim
export DEFAULT_TERM=alacritty
