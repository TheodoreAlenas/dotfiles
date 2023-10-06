PS1='$ '

alias vi=nvim
alias xc='xclip -selection clipboard'

# shellcheck disable=SC2164
c(){ cd "$@";pwd;eza; }

br() {
  # More information can be found in https://github.com/Canop/broot
  al_broot_cmd_file=$(mktemp)
  if broot --outcmd "$al_broot_cmd_file" "$@"; then
    al_broot_cmd=$(<"$al_broot_cmd_file")
    rm -f "$al_broot_cmd_file"
    eval "$al_broot_cmd"
  else
    al_broot_error_code=$?
    rm -f "$al_broot_cmd_file"
    return "$al_broot_error_code"
  fi
}

# record screen
rec() {
  ffmpeg \
    -f x11grab -s 1920x1080 -i :0.0 \
    -f alsa -itsoffset 0.3 -i hw:1 \
	-fs 2000M \
    "${1:-"$AL_RECORDING"}"
}
