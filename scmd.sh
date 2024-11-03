scmd_init() { scmd_compile_sxhkdrc && scmd_lemonbar_default; }
scmd_init__props() { "$@" silent; }
keys_reset() { killall -sUSR1 sxhkd; }

win_o() { bspc node next.local.leaf --focus; }
win_Q() { bspc node --close; }

win_1() { echo 1 > "$SCMD_TMP/arg"; }
win_2() { echo 2 > "$SCMD_TMP/arg"; }
win_3() { echo 3 > "$SCMD_TMP/arg"; }
win_4() { echo 4 > "$SCMD_TMP/arg"; }
win_5() { echo 5 > "$SCMD_TMP/arg"; }
win_6() { echo 6 > "$SCMD_TMP/arg"; }
win_7() { echo 7 > "$SCMD_TMP/arg"; }
win_8() { echo 8 > "$SCMD_TMP/arg"; }
win_9() { echo 9 > "$SCMD_TMP/arg"; }

win_0() { setxkbmap us; }  # english
win_l() { setxkbmap gr; }  # greek
language_dvorak() { setxkbmap us -variant dvorak; }
language_serbian() { setxkbmap rs; }
language_variant() { setxkbmap us "$(localectl list-x11-keymap-variants us | dmenu)"; }

scmd_arg() { arg="$(head "$SCMD_TMP/arg")"; echo "arg = $arg"; }
win_k() { scmd_arg; bspc desktop ^"$arg" --focus; }
win_j() { scmd_arg; bspc node --to-desktop ^"$arg"; }
win_m() { scmd_arg; v="$arg"0000; pactl set-sink-volume 0 "$v" "$v"; }
win_i() { scmd_arg; bspc node @parent --ratio +0."$arg"; }
win_r() { bspc node @parent --rotate 90; }
win_R() { bspc node @parent --rotate 180; }

window_st() { bspc node --flag sticky=on; }
window_ns() { bspc node --flag sticky=off; }
window_fs() { bspc node --state fullscreen; }
window_fl() { bspc node --state floating; }
window_ti() { bspc node --state tiled; }

show_win_rules() { bspc rule -l; }
show_win_properties() { xprop -id "$(bspc query -N -n)"; }
show_win_information() { xwininfo -id "$(bspc query -N -n)"; }
win_v() { alacritty -e vim + "$SCMD_TMP/log.sh"; }

metal_start() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=00:00; }
metal_this()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=05:48; }
metal_egypt() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=14:03; }
metal_feel()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=29:59; }
metal_msg()   { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=36:18; }
metal_awake() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=41:31; }
metal_rust()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=45:35; }

win_d() { date "+%+4Y-%m-%d %B, %A"; }
win_c() { df | sed -n '/e0n1p2/s/[0-9]\{6\} /,&/gp'; }
show_mem() { free|awk 'NR>1{t=int($2/200000);u=int($3/200000);printf("[%"u"s>%"t-u"s]","","")}';echo; }

win_w() { nmcli device connect wlo1; }
win_W() { nmcli radio wifi off && nmcli radio wifi on; }
show_wifi_strength() { nmcli device wifi list | sed -n '/^\*/s/  */ /gp'; }
show_wifi_which() { nmcli connection show --active | awk '/wifi/ {print $1}'; }

win_P() { alacritty -e sudo shutdown now; }
win_S() { scmd_compile_sxhkdrc; }
win_x() { v="$(dmenu < "$SCMD_FILE")" && scmd_wrap "${v%%(*}"; }
win_x__props() { "$@" silent; }

win_t() { alacritty; }
win_h() { head /sys/class/power_supply/BAT1/capacity; albatwid; alclowid; }
win_e() { emacs; }
win_b() { firefox_silent; }
firefox_silent() { firefox 2>&1 | grep --line-buffered -v mesa_glthread; }
open_intellij() { _JAVA_AWT_WM_NONREPARENTING=1 idea; }
open_libreoffice() { libreoffice; }
open_kdenlive() { kdenlive > /dev/null 2> /dev/null; }
open_krita() { krita > /dev/null 2> /dev/null; }
open_screenkey() { screenkey; }
open_unclutter() { unclutter; }
close_screenkey() { killall screenkey; }
close_unclutter() { killall unclutter; }
close_bspwm() { bspc quit; }

webcam_floating() { webc_rule_sf; mpv av://v4l2:/dev/video0 --vf=lavfi=hflip --profile=low-latency --untimed; }
webcam_vert() { webc_rule_sf; mpv av://v4l2:/dev/video0 --vf=lavfi=hflip,transpose=1 --profile=low-latency --untimed; }
webcam_tiled() { webc_rule_tiled; mpv av://v4l2:/dev/video0 --vf=lavfi=hflip --profile=low-latency --untimed; }
webcam_floating_not_flipped() { webc_rule_sf; mpv av://v4l2:/dev/video0 --profile=low-latency --untimed; }
webcam_tiled_not_flipped() { webc_rule_tiled; mpv av://v4l2:/dev/video0 --profile=low-latency --untimed; }
webc_rule_sf() { bspc rule --add '*:*:*' --one-shot sticky=on state=floating; }
webc_rule_tiled() { bspc rule --add '*:*:*' --one-shot state=tiled; }

: "${SCMD_FILE:=$HOME/.config/scmd.sh}"
: "${SCMD_TMP:=/tmp/scmd}"
: "${SCMD_SXHKDRC=$HOME/.config/sxhkd/sxhkdrc}"

scmd_lemonbar_default__props() { "$@" silent; }
scmd_lemonbar_default() {
    scmd_restart_tail \
        | python3 -c '
while True:
  raw = input()
  raw_end = raw.find("; } #")
  raw_len = len(raw)
  escaped = raw.replace("%", "%%")
  cmd_start = escaped.find("{") + 1
  cmd_end = escaped.find("; } #")
  out_start = escaped.find("|", cmd_end) + 1
  final = "%{c}%{F#667}" + escaped[:cmd_start] + "%{F-}" \
    + escaped[cmd_start:cmd_end] \
    + "%{F#667}" + escaped[cmd_end:out_start] + "%{F-}" \
    + escaped[out_start:] \
    + " " * max(0, 20 - (raw_len - raw_end))
  print(final)
' \
        | lemonbar -f "Source Code Pro-14" -b -B '#222' -F '#ccc'
}

scmd_restart_tail__props() { "$@" silent; }
scmd_restart_tail() {
    echo "ensuring the log file exists"
    mkdir -p "$SCMD_TMP"
    touch "$SCMD_TMP/log.sh"
    echo "killing old processes, if any"
    if [ -f "$SCMD_TMP/pids" ]; then
        while read -r l; do
            kill "$l"
        done < "$SCMD_TMP/pids"
        rm "$SCMD_TMP/pids"
    fi
    echo "starting tail"
    tail -f "$SCMD_TMP/log.sh" &
    echo $! >> "$SCMD_TMP/pids"
    wait
}

scmd_compile_sxhkdrc() {
    res="super + \1\n\t. $SCMD_FILE; scmd_wrap win_\1"
    sed -n "s|^win_\(.\)(.*|$res|p" "$SCMD_FILE" > "$SCMD_SXHKDRC"
    export SCMD_FILE SCMD_TMP SCMD_SXHKDRC
    killall sxhkd; SXHKD_SHELL=dash sxhkd &
}

scmd_wrap() {
    time="$(date +%H_%M_%S__)"
    def="$(grep "^$1(" "$SCMD_FILE" || echo "$1__not_in_scmd")"
    if command -v ${1}__props >/dev/null
    then silent="$(${1}__props printf "%s\n" | grep '^silent$')"
    else silent=
    fi
    ("$@" 2>&1; echo $?) \
        | python3 -c '
import sys
if sys.argv[2] == "silent":
  print(sys.argv[1] + "- silent  |")
  exit(0)
else:
  print(sys.argv[1] + "0 started |")
try:
  n = 1
  last = "SCMD RELATED ERROR"
  cur = ""
  while True:
    old = cur
    cur = input()
    last = old
    print(sys.argv[1] + str(n) + " running |" + cur)
    n += 1
except Exception:
  print(sys.argv[1] + str(n-2) + " err " + cur.ljust(3) + " |" + last)
' "$time$def #" "$silent" >> "$SCMD_TMP/log.sh"
}

scmd_test_1234() { for i in 1 2 3 4; do sleep 1 && echo $i; done; }
scmd_test_many_interactive() { scmd_test_many; }
scmd_test_many() {
    echo "Hello there..." > /tmp/del-me
    seq 100 | while read -r line; do
        sleep 0.05
        head /tmp/del-me
        first="$(sed 's/\(.\).*/\1/' /tmp/del-me)"
        rest="$(sed 's/.\(.*\)/\1/' /tmp/del-me)"
        echo "$rest$first" > /tmp/del-me
    done
}

scmd_print_license() {
    cat <<EOLICENSE

Copyright (c) 2023 Dimakopoulos Theodoros

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE

EOLICENSE
}
