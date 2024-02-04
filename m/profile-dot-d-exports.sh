# sourcing this file multiple times won't lengthen $PATH
export AL_PATH_FROM_ROOT="${AL_PATH_FROM_ROOT:-"$PATH"}"
AL_PATH_1=~/.local/bin
AL_PATH_2=~/.local/share/nvim/mason/bin
export PATH="$AL_PATH_1:$AL_PATH_2:$AL_PATH_FROM_ROOT"

export EDITOR=nvim
export DEFAULT_TERM=alacritty

export AL_SCREENSHOT=/tmp/screenshot.png
export AL_RECORDING=/tmp/rec.mkv

export L5=sdi1900048@linux15.di.uoa.gr
