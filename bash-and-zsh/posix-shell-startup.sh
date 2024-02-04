PS1='$ '
L5=sdi1900048@linux15.di.uoa.gr

alias vi=nvim
alias ls=eza
alias xc='xclip -selection clipboard'

# broot is a terminal file manager, note the `eval' here
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
  ffmpeg -f x11grab -s 1920x1080 -i :0.0 -fs 2000M "${1:-/tmp/rec.mkv}"
}

# record screen and audio
reca() {
  ffmpeg -f x11grab -s 1920x1080 -i :0.0 \
    -f alsa -itsoffset 0.3 -i hw:1 -af "volume=2.0" \
	-fs 2000M "${1:-/tmp/rec.mkv}"
}
