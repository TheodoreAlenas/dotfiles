# License at the bottom
# shellcheck disable=SC2016 disable=SC1090 disable=SC2012 disable=SC2120

about_usage() { . ./scmd.sh && scmd_upd && echo Super + X; }
about_main_dependencies() { which sxhkd dmenu lemonbar; }
about_secondary_dependencies() { which bspwm picom pulseaudio alacritty vim feh; }
about_debugging() { scmd_ls_keys_vim; scmd_sxhkdrc_vim; this_file; }
about_logging() { tail /tmp/scmd.sh; echo "Looks like: func() { echo hi; } #>>hi"; }
about_why() { echo "For the syntax highlighting and to reduce bugs."; }
about_how_to_write() { echo "Lines are only blank, comments or inline functions."; }
about_but_how_do_i() { echo "You don't. Think of the luxuries you'd lose for it."; }

win_other() { bspc node next.local.leaf --focus; } #o
win_opaque() { picom-trans --current "$(:|dmenu)"; }

win_properties_vim() { in_vim "xprop -id $(bspc query -N -n)"; }
win_information_vim() { in_vim "xwininfo -id $(bspc query -N -n)"; }
win_quit() { bspc node --close; } #Q

goto1() { bspc desktop ^1 --focus; } #1
goto2() { bspc desktop ^2 --focus; } #2
goto3() { bspc desktop ^3 --focus; } #3
goto4() { bspc desktop ^4 --focus; } #4
goto5() { bspc desktop ^5 --focus; } #5
goto6() { bspc desktop ^6 --focus; } #6
goto7() { bspc desktop ^7 --focus; } #7

language_greek()   { setxkbmap gr; } #9
language_english() { setxkbmap us; } #0
language_dvorak()  { setxkbmap us -variant dvorak; }
language_serbian() { setxkbmap rs; }
language_variant() { setxkbmap us "$(localectl list-x11-keymap-variants us | dmenu)"; }

win_goto1() { bspc node --to-desktop ^1; } #j1
win_goto2() { bspc node --to-desktop ^2; } #j2
win_goto3() { bspc node --to-desktop ^3; } #j3
win_goto4() { bspc node --to-desktop ^4; } #j4
win_goto5() { bspc node --to-desktop ^5; } #j5
win_goto6() { bspc node --to-desktop ^6; } #j6
win_goto7() { bspc node --to-desktop ^7; } #j7

vol0() { pactl set-sink-volume 0  1000  1000; } #m0
vol1() { pactl set-sink-volume 0  6000  6000; } #m1
vol2() { pactl set-sink-volume 0 12000 12000; } #m2
vol3() { pactl set-sink-volume 0 18000 18000; } #m3
vol4() { pactl set-sink-volume 0 24000 24000; } #m4
vol5() { pactl set-sink-volume 0 30000 30000; } #m5
vol6() { pactl set-sink-volume 0 36000 36000; } #m6
vol7() { pactl set-sink-volume 0 42000 42000; } #m7
vol8() { pactl set-sink-volume 0 48000 48000; } #m8
vol9() { pactl set-sink-volume 0 54000 54000; } #m9
vol() { pactl set-sink-volume 0 "$(:|dmenu)"; }

win_move_split_to_positives() { bspc node @parent --ratio +0.05; } #i
win_move_split_to_negatives() { bspc node @parent --ratio -0.05; } #d
win_move_split() { bspc node @parent --ratio "$(:|dmenu)"; }
win_flip_left_to_right() { bspc node @parent --flip horizontal; }
win_flip_top_to_bottom() { bspc node @parent --flip vertical; }
win_rotate_clockwise() { bspc node @parent --rotate 90; } #r
win_rotate_flipping() { bspc node @parent --rotate 180; } #R
win_rotate_counter_clockwise() { bspc node @parent --rotate 270; }

window_rules_vim() { in_vim 'bspc rule -l'; }

win_st() { bspc node --flag sticky=on; }
win_ns() { bspc node --flag sticky=off; }
win_fs() { bspc node --state fullscreen; }
win_fl() { bspc node --state floating; }
win_ti() { bspc node --state tiled; }

hs_start() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=00:00; }
hs_this()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=05:48; }
hs_egypt() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=14:03; }
hs_feel()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=29:59; }
hs_msg()   { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=36:18; }
hs_awake() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=41:31; }

wps() { bspc_float;feh --bg-scale "$(find ~/r/wp/ -type f -print0|xargs -0 sxiv -ot)"; }
wpf() { bspc_float;feh --bg-fill  "$(find ~/r/wp/ -type f -print0|xargs -0 sxiv -ot)"; }
wpm() { bspc_float;feh --bg-max   "$(find ~/r/wp/ -type f -print0|xargs -0 sxiv -ot)"; }
wpt() { bspc_float;feh --bg-tile  "$(find ~/r/wp/ -type f -print0|xargs -0 sxiv -ot)"; }
bspc_float() { bspc rule --add "${1:-"*:*:*"}" --one-shot state=floating; }

term_theme() { cd ~/p/c/ && alacritty -e sh -c "ls theming-alacritty/ | $(termfzfc)"; }
termfzfc() { a=alacritty; printf %s "fzf --preview 'cat $a-head.toml theming-$a/{} > ~/.config/$a/$a.toml'"; }

on_bspwm_startup() { scr_bn; scr_rl; wp_reset; bspwm-theme glass; lb_vert; }

wp_reset() { feh --bg-fill ~/r/wp/orange-distant-mountain-mostly-sky.jpg; }

picom_glass() { cp  ~/p/c/theming-picom/glass.conf  ~/.config/picom/picom.conf; }
picom_void()  { cp  ~/p/c/theming-picom/void.conf   ~/.config/picom/picom.conf; }

lb_vert()  { lbtv lemonbar -f "Source Code Pro-14" -b -B '#000e17' -F '#afbcbf'; }
lb_glass() { lbtf lemonbar -f "Source Code Pro-14" -b -B '#000e17' -F '#afbcbf'; }
lb_large() { lbtf lemonbar -f "Source Code Pro-24" -b -B '#000e17' -F '#afbcbf'; }
lbtf() { lbk; tail -f /tmp/scmd.sh | lb_paint | "$@"; }
lbtv() { lbk; tail -f /tmp/scmd.sh | lb_paint_vert | "$@"; }
lbk() { pidof tail|xargs -i ps -o ppid=,pid= -p {}|lbsib|xargs -i kill {}; }
lbsib() { awk "/ $(pidof lemonbar|xargs -i ps -o ppid= -p {}|tr -d ' ') /{print \$2}"; }
lb_paint() { lbp1|lbp2|lbp3|lbp4; }
lb_paint_vert() { lbp1|sed --unbuffered 's/^[^;]*;\([^(]*\).*#>>\(.*\)/%{c}  \1  \2/'; }
lbp1() { sed --unbuffered 's/%/%%/g' | stdbuf -o0 tr -c '[:print:]\n' '^'; }
lbp2() { sed --unbuffered 's/[0-9"]\| #[^ >]* \|dmenu/%{F#379cf6}&%{F-}/g'; }
lbp3() { sed --unbuffered 's/^:\| ; \|() *{\|; }\| }\|#>>/%{F#334}&%{F-}/g'; }
lbp4() { sed --unbuffered 's/\(:[^;]*;[^ ]* \)\(.*#>>\)\(.*\)/\1%{c}\2%{B#222f40}\3%{B-}/'; }

tth() { a=alacritty;cd ~/p/c&&cat $a-head.toml theming-$a/"$1" >~/.config/$a/$a.toml; }
term_theme_vert() { tth ef-night.toml; }
term_theme_round() { tth SeaShells.toml; }
term_theme_glass() { tth ef-night.toml; }
term_theme_void() { tth 3024_Day.toml; }

scr_bn() { xrandr --output eDP-1 --brightness 0.7; }
scr_bd() { xrandr --output eDP-1 --brightness "$(:|dmenu)"; }
scr_rn() { xrandr --output eDP-1 --rotate normal; }
scr_rl() { xrandr --output eDP-1 --rotate left; }

go_under() { (cd ~/r/g1 && p="$(printf "%s\n" * */* | dmenu)" && mpv --pause "$p"); }
go_tag() { (cd ~/r/g1 && sh tag.sh|awk "/$(:|dmenu)/"'{print $NF}'|xargs mpv --pause); }

scshreg()   { eval "shotgun $(slop -f '-i %i -g %g') /tmp/s.png"; } #s
scshreg3s() { cmd="shotgun $(slop -f '-i %i -g %g') /tmp/s.png"&&sleep 3&&eval "$cmd"; }
scshfs()    { sleep 0.2s && shotgun /tmp/screenshot.png; }
scshfs()    { sleep 0.5s && echo and && sleep 0.5s && echo now && shotgun /tmp/s.png; }
scshfsxs()  { sleep "$(:|dmenu)" && shotgun /tmp/s.png; echo taken; }
screenshot_clip() { xclip -in -sel clipboard -t image/png < /tmp/s.png; }
screenshot_view() { sxiv /tmp/s.png; }

clip_yt() { printf %s https://www.youtube.com/@theodorealenas3171 | xclip -selection clipboard -in; }
clip_gh()  { printf %s https://github.com/TheodoreAlenas/          | xclip -selection clipboard -in; }
clip_dot()  { printf %s https://github.com/TheodoreAlenas/dotfiles  | xclip -selection clipboard -in; }
clip_site()  { printf %s https://theodoros-d-alenas.site/            | xclip -selection clipboard -in; }
clip_insta()  { printf %s https://www.instagram.com/theodore_alenas/  | xclip -selection clipboard -in; }
clip_yt_tdd() { printf %s "https://www.youtube.com/watch?v=kScFczWbwRM"     |xclip -selection clipboard -in; }
clip_yt_tcr() { printf %s "https://youtu.be/tnO2Mos0RjU?si=OhTk8fUdI0FPTWT6"|xclip -selection clipboard -in; }

open_terminal() { alacritty; } #t
open_terminal_xterm() { xterm; }
open_battery_widget() { albatwid; } #a
open_clock_widget() { head /sys/class/power_supply/BAT1/capacity; albatwid; alclowid; } #h
open_clock_widget_for() { alclowid -t "$(:|dmenu -p timeout)"; }
open_emacs() { emacs; } #e
open_libreoffice() { libreoffice; }
open_spotify() { spotify-launcher > /dev/null 2> /dev/null; }
open_kdenlive() { kdenlive > /dev/null 2> /dev/null; }
open_krita() { krita > /dev/null 2> /dev/null; }
open_screenkey() { screenkey; }
open_unclutter() { unclutter; }
close_screenkey() { killall screenkey; }
close_unclutter() { killall unclutter; }
firefox_silent() { firefox 2>&1 | grep --line-buffered -v mesa_glthread; }
open_browser() { firefox_silent; } #b
open_last_recording() { mpv /tmp/rec.mkv; }
open_steno_keyboard() { ~/.local/bin/plover-4.0.0rc2-x86_64.AppImage; }
open_steno_keyboard_url() { qutebrowser https://github.com/openstenoproject/plover; }
close_bspwm() { killall bspwm; }

swev() { rm ~/.emacs.d; ln -s ~/.cache/emacs/vanilla/home-emacs-dot-d/ ~/.emacs.d; }
swed() { rm ~/.emacs.d; ln -s ~/.cache/emacs/doomemacs/ ~/.emacs.d; }

lb_free_disk() { df | sed -n '/e0n1p6/s/[0-9]\{6\} /,&/gp'; } #c
lb_mem() { free|awk 'NR>1{t=int($2/200000);u=int($3/200000);printf("[%"u"s>%"t-u"s]","","")}';echo; }
lb_date() { date "+%+4Y-%m-%d %B, %A"; }

preview_figlet_vim() { in_vim 'for f in /usr/share/figlet/fonts/*; do echo "$f"; figlet -f "$f" Figlet; done'; }
copy_glyph_or_emoji() { printf %s "$(dmenu < ~/l/gart/glyphs | cut -d' ' -f1)" | xclip -in -sel clipboard; }

reset_wifi_soft() { nmcli device connect wlo1; } #w
reset_wifi_hard() { nmcli radio wifi off && nmcli radio wifi on; echo "done"; } #W
poweroff_now() { in_terminal 'sudo shutdown now'; } #P

type_password() { p=~/.local/share/al/type;c="$p/$(ls "$p"|dmenu)" && xdotool type --delay 30 "$(base64 -d "$c")"; } #p

open_webcam_floating() { webc_rule_sf; mpv av://v4l2:/dev/video0 --vf=lavfi=hflip --profile=low-latency --untimed; }
open_webcam_tiled() { webc_rule_tiled; mpv av://v4l2:/dev/video0 --vf=lavfi=hflip --profile=low-latency --untimed; }
open_webcam_floating_not_flipped() { webc_rule_sf; mpv av://v4l2:/dev/video0 --profile=low-latency --untimed; }
open_webcam_tiled_not_flipped() { webc_rule_tiled; mpv av://v4l2:/dev/video0 --profile=low-latency --untimed; }
webc_rule_sf() { bspc rule --add '*:*:*' --one-shot sticky=on state=floating; }
webc_rule_tiled() { bspc rule --add '*:*:*' --one-shot state=tiled; }

scmd_stands_for_system_command() { :; }
scmd_run() { c="$(dmenu < "$(this_file)" | cut -d'(' -f1)"; test "$c" && scmd_with_bar_status "$c"; } #x
scmd_upd() { scmd_sxhkdrc > ~/.config/sxhkd/sxhkdrc; killall sxhkd; sxhkd & } #S
scmd_vim() { in_terminal "nvim $(this_file)"; }

scmd_ls_keys_vim() { in_vim scmd_ls_keys; }
scmd_ls_keys() { sed -n 's/^\([a-z0-9_]\+\)(.*#\([^}]*\)$/\2 \1/p' "$(this_file)"; }
scmd_sxhkdrc_vim() { in_vim scmd_sxhkdrc; }
scmd_sxhkdrc() { scmd_ls_keys | awk "{ $(scmd_awk1) $(scmd_awk2) }"; }
scmd_awk1() { printf %s 's = $1; gsub(/./, "; super + &", s); sub("; ", "", s); '; }
scmd_awk2() { printf %s 'print(s); printf("\t. %s && scmd_with_bar_status %s\n\n", "'"$(this_file)"'", $2);'; }
scmd_find() { printf "%s\n" "$(grep "^$1(" "$(this_file)")"; }
scmd_with_bar_status() { cline="$(scmd_find "$1")"; (echo; "$@" 2>&1) | scmd_bar_fmt "$cline" >> /tmp/scmd.sh; }
scmd_bar_fmt() { while read -r l; do printf ": $(date +%T) ; %s #>>%s\n" "$1" "$l"; done; }
scmd_give_bar_color_swap_fix() { echo "%{R}"; }
scmd_give_bar_test_1234() { for i in 1 2 3 4; do sleep 1 && echo "$i"; done; }
scmd_try_function() { c=$(dmenu<"$(this_file)"|cut -d'(' -f1)&&(a="$(:|dmenu -p $c)"&& :|dmenu -p stdin|eval "$c $a"); }

in_vim() { alacritty -e sh -c ". $(this_file) && $1 | vim -"; }
in_terminal() { alacritty -e sh -c "$1"; }
this_file() { echo ~/p/c/scmd.sh; }

# Copyright (c) 2023 Dimakopoulos Theodoros
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
