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

first_missing_path() {
  while read -r n; do if ! test -e "$n"; then echo "$n"; break; fi; done
}

rec() {
  rec_next="$(seq -w 99 | sed 's/$/.mkv/' | first_missing_path)"
  ffmpeg -f x11grab -s 1920x1080 -i :0.0 -fs 2000M "${1:-"$rec_next"}"
}
