win_o() { bspc node next.local.leaf --focus; }
win_Q() { bspc node --close; }

win_1() { bspc desktop ^1 --focus; }
win_2() { bspc desktop ^2 --focus; }
win_3() { bspc desktop ^3 --focus; }
win_4() { bspc desktop ^4 --focus; }
win_5() { bspc desktop ^5 --focus; }
win_6() { bspc desktop ^6 --focus; }
win_7() { bspc desktop ^7 --focus; }
win_8() { bspc desktop ^8 --focus; }
win_9() { bspc desktop ^9 --focus; }

win_0() { setxkbmap us; }
win_l() { setxkbmap gr; }
language_dvorak() { setxkbmap us -variant dvorak; }
language_serbian() { setxkbmap rs; }
language_variant() { setxkbmap us "$(localectl list-x11-keymap-variants us | dmenu)"; }

pick_desktop() { v="$(bspc query -D|awk '{print NR}'|dmenu -l 0)" && echo "v = $v"; }
win_j() { pick_desktop && bspc node --to-desktop ^"$v"; }

pick_volume() { v="$(echo 22|dmenu -l 0)" && [ $((v<100)) = 1 ] && echo "v = $v"; }
win_m() { pick_volume && pactl set-sink-volume 0 "$v"000 "$v"000; }

pick_mantissa() { v="$(echo 5|dmenu)" && echo "v = $v"; }
win_i() { pick_mantissa; bspc node @parent --ratio 0.$v; }

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
win_v() { awk '{print NR, $0}' "$SCMD_TMP/log.sh" | tac | dmenu; }
win_v__silent() { :; }

metal_start() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=00:00; }
metal_this()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=05:48; }
metal_egypt() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=14:03; }
metal_feel()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=29:59; }
metal_msg()   { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=36:18; }
metal_awake() { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=41:31; }
metal_rust()  { mpv ~/r/music-laptop/hellsinger-fast.mp4 --start=45:35; }

win_s() { eval "shotgun $(slop -f '-i %i -g %g') /tmp/s.png"; }
scshreg3s() { cmd="shotgun $(slop -f '-i %i -g %g') /tmp/s.png"&&sleep 3&&eval "$cmd"; }
scshfs() { sleep 0.2s && shotgun /tmp/screenshot.png; }
scshfs1s() { sleep 0.5s && echo and && sleep 0.5s && echo now && shotgun /tmp/s.png; }
scshfsxs() { sleep "$(:|dmenu)" && shotgun /tmp/s.png; echo taken; }
screenshot_clip() { xclip -in -sel clipboard -t image/png < /tmp/s.png; }
screenshot_view() { sxiv /tmp/s.png; }

win_d() { date "+%+4Y-%m-%d %B, %A"; }
win_c() { df | sed -n '/e0n1p2/s/[0-9]\{6\} /,&/gp'; }
show_mem() { free|awk 'NR>1{t=int($2/200000);u=int($3/200000);printf("[%"u"s>%"t-u"s]","","")}';echo; }

win_w() { nmcli device connect wlo1; }
win_W() { nmcli radio wifi off && nmcli radio wifi on; }
show_wifi_strength() { nmcli device wifi list | sed -n '/^\*/s/  */ /gp'; }
show_wifi_which() { nmcli connection show --active | awk '/wifi/ {print $1}'; }

win_P() { xterm -e sudo shutdown now; }
win_x() { v="$(dmenu < "$SCMD_FILE")" && scmd_big_wrap "${v%%(*}"; }
win_x__silent() { :; }

win_t() { xterm; }
win_h() { head /sys/class/power_supply/BAT1/capacity; albatwid; alclowid; }
win_e() { emacs; }
win_E() { emacs --debug-init; }
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

scmd_nop() { :; };    . scmd_big.sh

scmd_init() { scmd_big_sxhkdrc && scmd_sxhkd && scmd_lemonbar; }
scmd_init__silent() { :; }

scmd_lemonbar__silent() { :; }
scmd_lemonbar() { scmd_big_restart_tail | scmd_bar.py | scmd__bar; }
scmd__bar() { lemonbar -f "Source Code Pro-14" -b -B '#222' -F '#ccc'; }

scmd_sxhkd() { killall sxhkd; SXHKD_SHELL=dash sxhkd & }

scmd_test_1234() { for i in 1 2 3 4; do sleep 1 && echo $i; done; }
scmd_test_carousel() { scmd_big_test_carousel; }
