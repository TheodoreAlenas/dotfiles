# License at the bottom
# shellcheck disable=SC2016 disable=SC1090 disable=SC2012 disable=SC2120
window_other() { bspc node next.local.leaf --focus; } #o
window_replace() { bspc node --swap "$(win_dmenu)"; }
window_find() { bspc node "$(win_dmenu)" --focus; } #b
goto_window() { bspc node "$(win_dmenu)" --focus; }
window_bring() { bspc node "$(win_dmenu)" --to-node focused; }
window_replace_other() { bspc node @brother --swap "$(win_dmenu)"; }
window_hide() { bspc node @brother -f; bspc node @brother --to-desktop ^7; }
window_hide_other() { bspc node @brother --to-desktop ^7; }

win_dmenu() { w="$(win_query | for_each win_info)"; printf "%s\n" "$w" | dmenu -p 'last at top' | cut -d: -f1; }
win_query() { last="$(bspc query -N -n last)"; echo "$last"; bspc query -N | grep -v "$last"; }
for_each() { while read -r l; do "$@" "$l"; done; }
win_info() { printf "%s: %s\n" "$1" "$(xdotool getwindowclassname "$1" getwindowname "$1" | tr '\n' ' ')"; }
win_infos_vim() { in_vim "win_query | for_each win_info"; }

window_opaque_20() { picom-trans --current 20; }
window_opaque_80() { picom-trans --current 80; }
window_opaque_95() { picom-trans --current 95; }
window_opaque_99() { picom-trans --current 99; }
window_opaque_100() { picom-trans --current 100; }
window_opaque() { picom-trans --current "$(:|dmenu)"; }

window_properties_vim() { in_vim "xprop -id $(bspc query -N -n)"; }
window_information_vim() { in_vim "xwininfo -id $(bspc query -N -n)"; }
window_close() { bspc node --close; } #Q

goto_desktop() { bspc desktop "$(bspc query -D --names | dmenu)" -f; }
goto_desktop_1() { bspc desktop ^1 --focus; } #1
goto_desktop_2() { bspc desktop ^2 --focus; } #2
goto_desktop_3() { bspc desktop ^3 --focus; } #3
goto_desktop_4() { bspc desktop ^4 --focus; } #4
goto_desktop_5() { bspc desktop ^5 --focus; } #5
goto_desktop_6() { bspc desktop ^6 --focus; } #6
goto_desktop_7() { bspc desktop ^7 --focus; } #7

window_to_desktop() { bspc node --to-desktop "$(bspc query -D --names|dmenu)"; }
window_to_desktop_1() { bspc node --to-desktop ^1; } #j1
window_to_desktop_2() { bspc node --to-desktop ^2; } #j2
window_to_desktop_3() { bspc node --to-desktop ^3; } #j3
window_to_desktop_4() { bspc node --to-desktop ^4; } #j4
window_to_desktop_5() { bspc node --to-desktop ^5; } #j5
window_to_desktop_6() { bspc node --to-desktop ^6; } #j6
window_to_desktop_7() { bspc node --to-desktop ^7; } #j7

window_move_split_to_positives() { bspc node @parent --ratio +0.05; } #i
window_move_split_to_negatives() { bspc node @parent --ratio -0.05; } #d
window_move_split() { bspc node @parent --ratio "$(:|dmenu)"; }
window_flip_left_to_right() { bspc node @parent --flip horizontal; }
window_flip_top_to_bottom() { bspc node @parent --flip vertical; }
window_rotate_clockwise() { bspc node @parent --rotate 90; } #r
window_rotate_flipping() { bspc node @parent --rotate 180; } #R
window_rotate_counter_clockwise() { bspc node @parent --rotate 270; }

window_focus_parent() { bspc node @parent --focus; }
window_focus_first_child() { bspc node @first --focus; }
window_focus_second_child() { bspc node @second --focus; }

window_rules_vim() { in_vim 'bspc rule -l'; }

window_set_sticky()   { bspc node --flag sticky=on; }
window_unset_sticky()   { bspc node --flag sticky=off; }
window_set_fullscreen()   { bspc node --state fullscreen; }
window_set_floating()   { bspc node --state floating; }
window_set_tiled()   { bspc node --state tiled; }

keyboard_language_set_greek()     { setxkbmap gr; } #9
keyboard_language_set_dvorak()   { setxkbmap us -variant dvorak; } #0
keyboard_language_set_english() { setxkbmap us; }
keyboard_language_set_serbian() { setxkbmap rs; } #8
keyboard_language_set_variant() { setxkbmap us "$(localectl list-x11-keymap-variants us | dmenu)"; }

hellsinger_start() { mpv ~/l/gmus/hellsinger-fast.mp4 --start=00:00 --volume=50; } #ms
hellsinger_this()  { mpv ~/l/gmus/hellsinger-fast.mp4 --start=05:48 --volume=50; } #mt
hellsinger_egypt() { mpv ~/l/gmus/hellsinger-fast.mp4 --start=14:03 --volume=50; } #me
hellsinger_feel()  { mpv ~/l/gmus/hellsinger-fast.mp4 --start=29:59 --volume=50; } #mf
hellsinger_msg()   { mpv ~/l/gmus/hellsinger-fast.mp4 --start=36:18 --volume=50; } #mm
hellsinger_away()  { mpv ~/l/gmus/hellsinger-fast.mp4 --start=41:31 --volume=50; } #ma

volume_set_0() { pacmd set-sink-volume 0  1000; } #m0
volume_set_1() { pacmd set-sink-volume 0  6000; } #m1
volume_set_2() { pacmd set-sink-volume 0 12000; } #m2
volume_set_3() { pacmd set-sink-volume 0 18000; } #m3
volume_set_4() { pacmd set-sink-volume 0 24000; } #m4
volume_set_5() { pacmd set-sink-volume 0 30000; } #m5
volume_set_6() { pacmd set-sink-volume 0 36000; } #m6
volume_set_7() { pacmd set-sink-volume 0 42000; } #m7
volume_set_8() { pacmd set-sink-volume 0 48000; } #m8
volume_set_9() { pacmd set-sink-volume 0 54000; } #m9
volume_set_custom() { pacmd set-sink-volume 0 "$(:|dmenu)"; }

wallpaper_set_scale() { bspc_float; feh --bg-scale "$(find ~/l/gwp/ -type f -print0 | xargs -0 sxiv -ot)"; }
wallpaper_set_fill()  { bspc_float; feh --bg-fill  "$(find ~/l/gwp/ -type f -print0 | xargs -0 sxiv -ot)"; }
wallpaper_set_max()   { bspc_float; feh --bg-max   "$(find ~/l/gwp/ -type f -print0 | xargs -0 sxiv -ot)"; }
wallpaper_set_tile()  { bspc_float; feh --bg-tile  "$(find ~/l/gwp/ -type f -print0 | xargs -0 sxiv -ot)"; }

bspc_float() { bspc rule --add "${1:-"*:*:*"}" --one-shot state=floating; }

terminal_set_opacity()     { sed -i "s/\bopacity:.*/opacity: $(:|dmenu)/" ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_0()   { sed -i "s/\bopacity:.*/opacity: 0.0/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_10()  { sed -i "s/\bopacity:.*/opacity: 0.1/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_20()  { sed -i "s/\bopacity:.*/opacity: 0.2/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_50()  { sed -i "s/\bopacity:.*/opacity: 0.5/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_60()  { sed -i "s/\bopacity:.*/opacity: 0.6/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_70()  { sed -i "s/\bopacity:.*/opacity: 0.7/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_80()  { sed -i "s/\bopacity:.*/opacity: 0.8/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_90()  { sed -i "s/\bopacity:.*/opacity: 0.9/"  ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_95()  { sed -i "s/\bopacity:.*/opacity: 0.95/" ~/.config/alacritty/alacritty.yml; }
terminal_set_opacity_100() { sed -i "s/\bopacity:.*/opacity: 1.0/"  ~/.config/alacritty/alacritty.yml; }

terminal_theme_set() { term_rule_dock; a=alacritty; cd ~/.config/$a/ && $a -e sh -c "$(term_fzf_prvw_cat)"; } #v
term_rule_dock() { bspc rule --add '*:*:*' --one-shot state=floating -g 1900x500+10+500; }
term_fzf_prvw_cat() { printf %s "ls colors/ | fzf --preview 'cat head.yml colors/{} > alacritty.yml'"; }

global_theme_set_hell()  { global_theme_set hell; }
global_theme_set_round()  { global_theme_set round; }
global_theme_set_glass()  { global_theme_set glass; }
global_theme_set_purple()  { global_theme_set purple; }
global_theme_set_autumn()  { global_theme_set autumn; }
global_theme_set_bright()  { global_theme_set bright; }
global_theme_set_space()  { global_theme_set space; }
global_theme_set_void()  { global_theme_set void; }

global_theme_set_bspwm_startup() { global_theme_set glass; }
global_theme_set() { for t in terminal dmenu wallpaper picom bspwm lemonbar; do "${t}_theme_set_$1"; done; }

picom_theme_set_hell()  { cp  ~/.config/picom/hell.conf  ~/.config/picom/picom.conf; }
picom_theme_set_round()  { cp  ~/.config/picom/round.conf  ~/.config/picom/picom.conf; }
picom_theme_set_glass()  { cp  ~/.config/picom/glass.conf  ~/.config/picom/picom.conf; }
picom_theme_set_purple()  { cp  ~/.config/picom/glass.conf  ~/.config/picom/picom.conf; }
picom_theme_set_autumn()  { cp  ~/.config/picom/autumn.conf  ~/.config/picom/picom.conf; }
picom_theme_set_bright()  { cp  ~/.config/picom/space.conf  ~/.config/picom/picom.conf; }
picom_theme_set_space()  { cp  ~/.config/picom/space.conf  ~/.config/picom/picom.conf; }
picom_theme_set_void()  { cp  ~/.config/picom/void.conf  ~/.config/picom/picom.conf; }

bspwm_theme_set_hell()  { sh ~/.config/bspwm/themes/hell.sh; }
bspwm_theme_set_round()  { sh ~/.config/bspwm/themes/round.sh; }
bspwm_theme_set_glass()  { sh ~/.config/bspwm/themes/glass.sh; }
bspwm_theme_set_purple()  { sh ~/.config/bspwm/themes/silent.sh; }
bspwm_theme_set_autumn()  { sh ~/.config/bspwm/themes/autumn.sh; }
bspwm_theme_set_bright()  { sh ~/.config/bspwm/themes/glass.sh; }
bspwm_theme_set_space()  { sh ~/.config/bspwm/themes/space.sh; }
bspwm_theme_set_void()  { sh ~/.config/bspwm/themes/void.sh; }

lemonbar_theme_set_hell() {   kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#05080c' -F '#aa1122'; }
lemonbar_theme_set_round() {  kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#08131a' -F '#1d4850'; }
lemonbar_theme_set_glass() {  kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#24283b' -F '#7aa2f7'; }
lemonbar_theme_set_purple() { kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#0e0c15' -F '#42a38c'; }
lemonbar_theme_set_autumn() { kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#05080c' -F '#aa1122'; }
lemonbar_theme_set_bright() { kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#05080c' -F '#aaaabb'; }
lemonbar_theme_set_space() {  kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#05080c' -F '#aaaabb'; }
lemonbar_theme_set_void() {   kill_lmbr_tail_F lemonbar -f "Source Code Pro-14" -b -B '#05080c' -F '#aaaabb'; }

lemonbar_theme_set_large() {  kill_lmbr_tail_F lemonbar -f "Source Code Pro-24" -b -B '#24283b' -F '#7aa2f7'; }
kill_lmbr_tail_F() { killall lemonbar; tail -F /tmp/lemonbar | "$@"; }

wallpaper_theme_set_hell() { feh --bg-fill ~/l/gwp/rebecca-jansen.jpg; }
wallpaper_theme_set_round() { feh --bg-scale ~/l/gwp/gradient-blue-pink.jpg; }
wallpaper_theme_set_glass() { feh --bg-scale ~/l/gwp/abstract-glass-rings-blue.jpg; }
wallpaper_theme_set_purple() { feh --bg-scale ~/l/gwp/03-rails.jpg; }
wallpaper_theme_set_autumn() { feh --bg-scale ~/l/gwp/orange-leaves-autumn.jpg; }
wallpaper_theme_set_bright() { feh --bg-scale ~/l/gwp/flowers-space-yellow-dark.png; }
wallpaper_theme_set_space() { feh --bg-scale ~/l/gwp/flowers-space-yellow-dark.png; }
wallpaper_theme_set_void() { feh --bg-scale ~/l/gwp/gradient-liquid-glass.jpg; }

terminal_theme_set_hell() { cd ~/.config/alacritty/ && cat head.yml colors/al_hell.conf          > alacritty.yml; }
terminal_theme_set_round() { cd ~/.config/alacritty/ && cat head.yml colors/SeaShells.conf        > alacritty.yml; }
terminal_theme_set_glass() { cd ~/.config/alacritty/ && cat head.yml colors/tokyo-night-storm.yml > alacritty.yml; }
terminal_theme_set_purple() { cd ~/.config/alacritty/ && cat head.yml colors/Floraverse.conf      > alacritty.yml; }
terminal_theme_set_autumn() { cd ~/.config/alacritty/ && cat head.yml colors/FunForrest.conf      > alacritty.yml; }
terminal_theme_set_bright() { cd ~/.config/alacritty/ && cat head.yml colors/CLRS.conf            > alacritty.yml; }
terminal_theme_set_space() { cd ~/.config/alacritty/ && cat head.yml colors/Glacier.conf          > alacritty.yml; }
terminal_theme_set_void() { cd ~/.config/alacritty/ && cat head.yml colors/3024_Day.conf         > alacritty.yml; }

#awk '/foreground|background|black|blue/{print}' ~/.config/alacritty/colors/SeaShells.conf
dm_wr_hell() { dmenu-legitimate -nf '#887766' -nb '#000000' -sf '#aaaaaa' -sb '#550000'; }
dm_wr_round() { dmenu-legitimate -nf '#deb88d' -nb '#08131a' -sf '#deb88d' -sb '#1d4850'; }
dm_wr_glass() { dmenu-legitimate -nf '#c0caf5' -nb '#24283b' -sf '#15161e' -sb '#7aa2f7'; }
dm_wr_purple() { dmenu-legitimate -nf '#42a38c' -nb '#0e0c15' -sf '#cd751c' -sb '#0e0c15'; }
dmenu_theme_set_hell() { printf '#!/bin/sh\n. %s&&dm_wr_hell "$@"' "$(this_file)" > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_round() { printf '#!/bin/sh\n. %s&&dm_wr_round "$@"' "$(this_file)" > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_glass() { printf '#!/bin/sh\n. %s&&dm_wr_glass "$@"' "$(this_file)" > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_purple() { printf '#!/bin/sh\n. %s&&dm_wr_purple "$@"' "$(this_file)" > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_autumn() { printf "%s\n" '#!/bin/sh' 'dmenu-legitimate -c blue "$@"' > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_bright() { printf "%s\n" '#!/bin/sh' 'dmenu-legitimate -c black "$@"' > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_space() { printf "%s\n" '#!/bin/sh' 'dmenu-legitimate -c black "$@"' > ~/.local/bin/dmenu-wrapper.sh; }
dmenu_theme_set_void() { printf "%s\n" '#!/bin/sh' 'dmenu-legitimate -c black "$@"' > ~/.local/bin/dmenu-wrapper.sh; }

screen_brightness_set_1() { xrandr --output eDP-1 --brightness 0.1; }
screen_brightness_set_2() { xrandr --output eDP-1 --brightness 0.2; }
screen_brightness_set_3() { xrandr --output eDP-1 --brightness 0.3; }
screen_brightness_set_4() { xrandr --output eDP-1 --brightness 0.4; }
screen_brightness_set_5() { xrandr --output eDP-1 --brightness 0.5; }
screen_brightness_set_6() { xrandr --output eDP-1 --brightness 0.6; }
screen_brightness_set_7() { xrandr --output eDP-1 --brightness 0.7; }
screen_brightness_set_8() { xrandr --output eDP-1 --brightness 0.8; }
screen_brightness_set_9() { xrandr --output eDP-1 --brightness 0.9; }
screen_brightness_set_normal()  { xrandr  --output eDP-1  --brightness 0.7; }
screen_brightness_set_custom()  { xrandr  --output eDP-1  --brightness "$(:|dmenu)"; }

goodones_open_under() { (cd ~/l/g1 && p="$(printf "%s\n" * */* | dmenu)" && mpv --pause "$p"); }
goodones_open_tagged() { (cd ~/l/g1 && sh tag.sh | awk "/$(:|dmenu)/"'{print $NF}' | xargs mpv --pause); }
goodones_open_newest()   { find ~/l/g1 -type f -printf "%B@\t%p\n"|sort -r|cut -f2|xargs mpv --pause; }
goodones_open_accessed() { find ~/l/g1 -type f -printf "%A@\t%p\n"|sort -r|cut -f2|xargs mpv --pause; }
goodones_open_changed()  { find ~/l/g1 -type f -printf "%C@\t%p\n"|sort -r|cut -f2|xargs mpv --pause; }
goodones_open_shuffled() { find ~/l/g1 -type f | shuf | xargs mpv --pause; } #g
goodones_open_sorted()   { find ~/l/g1 -type f | sort | xargs mpv --pause; }
goodones_vim() { in_vim 'echo "mpv --no-terminal --pause"; find ~/g1 -type f'; }

screenshot_take_region()   { eval "shotgun $(slop -f '-i %i -g %g') /tmp/screenshot.png"; } #w
screenshot_take_fullscreen()   { sleep 0.2s && shotgun /tmp/screenshot.png; }
screenshot_take_fullscreen_1s()   { sleep 0.5s && echo and && sleep 0.5s && echo now && shotgun /tmp/screenshot.png; }
screenshot_take_fullscreen_3s()   { sleep 3s && shotgun /tmp/screenshot.png; echo taken; }
screenshot_take_fullscreen_now()   { shotgun /tmp/screenshot.png; }
screenshot_take_fullscreen_delay()   { sleep "$(:|dmenu)" && shotgun /tmp/screenshot.png; }
screenshot_copy_in_clipboard()   { xclip -in -sel clipboard -t image/png < /tmp/screenshot.png; }
screenshot_view()   { sxiv /tmp/screenshot.png; }

clipboard_youtube_channel() { printf %s "https://www.youtube.com/@theodorealenas3171"|xclip -selection clipboard -in; }

open_terminal() { alacritty; } #t

open_battery_widget() { albatwid; } #u
open_battery_widget_old() { head /sys/class/power_supply/BAT1/capacity; alm-battery; } #U
open_battery_widget_old_longer() { alm-battery -t 3 -s 0.5; }

open_clock_widget() { date; alm-clock; } #h
open_clock_widget_for() { alm-clock -t "$(:|dmenu)"; }
open_clock_widget_longer() { alm-clock -t 5; } #H

open_emacs() { emacs; } #em
open_spotify() { spotify-launcher > /dev/null 2> /dev/null; }
open_kdenlive() { kdenlive > /dev/null 2> /dev/null; }
open_krita() { krita > /dev/null 2> /dev/null; }
open_screenkey() { screenkey; }
open_unclutter() { unclutter; }
close_screenkey() { killall screenkey; }
close_unclutter() { killall unclutter; }
open_qutebrowser() { qutebrowser --loglevel critical; } #a
open_last_recording() { mpv /tmp/rec.mkv; }
open_zathura_in_downloads() { f="$(find ~/Downloads | dmenu)" && zathura "$f"; }

switch_emacs_to_vanilla() { rm ~/.emacs.d; ln -s ~/.cache/emacs/vanilla/home-emacs-dot-d/ ~/.emacs.d; }
switch_emacs_to_doom() { rm ~/.emacs.d; ln -s ~/.cache/emacs/doom/home-emacs-dot-d/ ~/.emacs.d; }

lemonbar_show_date() { date; } #cd
lemonbar_show_free_disk() { df -h | awk '/e0n1p6/{print $4}'; } #cf
lemonbar_show_memory() { free|awk 'NR>1{t=int($2/200000);u=int($3/200000);printf("[%"u"s>%"t-u"s]","","")}';echo; } #cm
lemonbar_input_vim() { in_terminal "vi '+$' /tmp/lemonbar"; }

preview_figlet_vim() { in_vim 'for f in /usr/share/figlet/fonts/*; do echo "$f"; figlet -f "$f" Figlet; done'; }
copy_glyph_or_emoji() { printf %s "$(dmenu < ~/l/gart/glyphs | cut -d' ' -f1)" | xclip -in -sel clipboard; }

reset_wifi_soft() { nmcli device connect wlo1; } #er
reset_wifi_hard() { nmcli radio wifi off && nmcli radio wifi on; echo "done"; }
poweroff_now() { in_terminal 'sudo shutdown now'; } #eq
poweroff_in_5_minutes() { in_terminal 'sudo shutdown +5'; }
poweroff_after_midnight() { in_terminal 'sudo shutdown 02:00'; }
poweroff_reboot() { in_terminal 'sudo shutdown --reboot now'; }

type_password() { p=~/.local/share/al/type;c="$p/$(ls "$p"|dmenu)" && xdotool type --delay 30 "$(base64 -d "$c")"; } #zi

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
scmd_with_bar_status() { cline="$(scmd_find "$1")"; (echo; "$@" 2>&1) | scmd_bar_fmt "$cline" >> /tmp/lemonbar; }
scmd_bar_fmt() { while read -r l; do scmd_bar_paint "$1" "$l"; done; }
scmd_bar_paint() { printf "%s\n" "%{c}  $(printf %s "$1" | scmd_bar_sed)  %{R}$2%{R}"; }
scmd_bar_sed() { sed 's/\(^[^(]*\)\([^{]*{\)\(.*\)\(}[^}]*$\)/\1%{F#666}\2%{F-}\3%{F#666}\4%{F-}/'; }
scmd_give_bar_color_swap_fix() { echo "%{R}"; }
scmd_give_bar_test_1234() { for i in 1 2 3 4; do sleep 1 && echo "$i"; done; }

in_vim() { term_rule_dock && alacritty -e sh -c ". $(this_file) && $1 | vim -"; }
in_terminal() { term_rule_dock && alacritty -e sh -c "$1"; }
this_file() { echo ~/.config/scmd.sh; }

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
