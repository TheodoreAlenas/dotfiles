win_o() { bspc node next.local.leaf --focus; }
win_Q() { bspc node --close; }

win_j() { bspc desktop ^1 --focus; }
win_k() { bspc desktop ^2 --focus; }
win_l() { bspc desktop ^3 --focus; }

win_8() { setxkbmap gr; }
win_9() { setxkbmap gr; }
win_0() { setxkbmap us; }
language_dvorak() { setxkbmap us -variant dvorak; }
language_serbian() { setxkbmap rs; }
language_variant() { setxkbmap us "$(localectl list-x11-keymap-variants us | dmenu)"; }

pick_desktop() { v="$(bspc query -D|awk '{print NR}'|dmenu -l 0)" && echo "v = $v"; }
win_u() { pick_desktop && bspc node --to-desktop ^"$v"; }
win_U() { pick_desktop && bspc desktop ^"$v" --focus; }

pick_volume() { v="$(echo 22|dmenu -l 0)" && [ $((v<100)) = 1 ] && echo "v = $v"; }
win_m() { pick_volume && pactl set-sink-volume 0 "$v"000 "$v"000; }

pick_mantissa() { v="$(echo 5|dmenu)" && echo "v = $v"; }
resize_window() { pick_mantissa; bspc node @parent --ratio 0.$v; }

rotate_clockwise() { bspc node @parent --rotate 90; }
rotate_ccw() { bspc node @parent --rotate 180; }
rotate_vert() { xrandr --output eDP-1 --rotate left; }
rotate_horizontal() { xrandr --output eDP-1 --rotate normal; }
rotate_upside_down() { xrandr --output eDP-1 --rotate inverted; }

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

vtag_play_tagged_video() { cd ~/2r/vid && vtag_pick && mpv "$v"; }
vtag_pick() { l="$(vtag_ls | dmenu -i)" && vtag_file "$l" && echo "v = $v"; }
vtag_ls() { awk 'BEGIN {s = 0} {print s, $0} $0 == "" {s += 1}' tags; }
vtag_file() { v="$(vtag_ls | awk "/^${1%% *}/ {print \$2; exit}")"; }

metal_hellsinger_messengers() { mpv ~/2r/vid/24112305hscinder.webm --start=00:29 --speed=1.20; }
metal_hellsinger_you_farted() { mpv ~/2r/vid/24112305hscinder.webm --start=01:00.5; }
metal_hellsinger_awaken() { mpv ~/2r/vid/24112306hsblood.webm --start=02:12; }
metal_hellsinger_deep_within() { mpv ~/2r/vid/24112306hsblood.webm --start=03:19 --speed=1.20; }

pick_video_src() { . ./tags.sh && v="$(on_all get_src | dmenu)" && echo "v = ${v%% *} ..."; }
copy_source() { cd ~/2r/vid && pick_video_src && echo "${v##* }" | xclip -in -sel clip; }

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

pick_alarm() { v="$(echo 50|dmenu -l 0)" && [ $((v<100)) = 1 ] && echo "v = $v"; }
alarm_set() { pick_alarm && killall albatwid-alarm && albatwid-alarm $v 5000; }

speed_up_keyboard() { xset -display :0.0 r rate 250 40; }

win_P() { xterm -e sudo shutdown now; }
win_x() { v="$(dmenu < "$SCMD_FILE")" && scmd_big_wrap "${v%%(*}"; }
win_x__silent() { :; }

win_t() { xterm; }
win_h() { alclowid; }
open_battery_widget() { albatwid; }
win_e() { emacs; }
open_emacs_bug_fixing() { emacs --debug-init; }
open_obsidian() { Obsidian-1.8.9.AppImage; }
open_vscode() { code; }
win_b() { firefox_silent; }
firefox_silent() { firefox 2>&1 | grep --line-buffered -v mesa_glthread; }
open_intellij() { _JAVA_AWT_WM_NONREPARENTING=1 idea; }
open_libreoffice() { libreoffice; }
open_kdenlive() { kdenlive > /dev/null 2> /dev/null; }
open_krita() { krita > /dev/null 2> /dev/null; }
open_inkscape() { inkscape; }
open_screenkey() { screenkey; }
open_unclutter() { unclutter; }
close_screenkey() { killall screenkey; }
close_unclutter() { killall unclutter; }
close_bspwm() { kill $(head /tmp/scmd/pids); killall albatwid-alarm; bspc quit; }

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

scmd_lemonbar() { scmd_big_restart_tail | barprint | scmd__bar; }
scmd_lemonbar__silent() { :; }
scmd_lemonbar_recompile() { cd ~/3p/bar && make && (killall barprint; cp barprint ~/.local/bin/); }
scmd_lemonbar_refresh() { scmd_lemonbar_recompile && scmd_lemonbar; }
scmd_lemonbar_old() { scmd_big_restart_tail | scmd_bar.py | scmd__bar; }
scmd_lemonbar_old__silent() { :; }
scmd__bar() { lemonbar -f "Source Code Pro-14" -b -B '#222' -F '#ccc'; }

scmd_sxhkd() { killall sxhkd; SXHKD_SHELL=dash sxhkd & }

scmd_test_1234() { for i in 1 2 3 4; do sleep 1 && echo $i; done; }
scmd_test_carousel() { scmd_big_test_carousel; }
