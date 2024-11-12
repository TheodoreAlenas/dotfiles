#!/bin/sh

: "${SCMD_FILE:=$HOME/.local/bin/scmd.sh}"
: "${SCMD_TMP:=/tmp/scmd}"
: "${SCMD_SXHKDRC:=$HOME/.config/sxhkd/sxhkdrc}"
export SCMD_FILE SCMD_TMP SCMD_SXHKDRC

scmd_big__restart_tail() {
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

scmd_big_sxhkdrc() { scmd_big_sxhkdrc_print > "$SCMD_SXHKDRC"; }
scmd_big_sxhkdrc_print() {
    printf "%s\n" \
           "super + {a-z,A-Z,0-9}" \
           " . $SCMD_FILE && scmd_big_wrap win_{a-z,A-Z,0-9}"
}

scmd_big_wrap() {
    time="$(date +%H_%M_%S__)"
    def="$(grep "^$1(" "$SCMD_FILE" || echo "$1__not_in_scmd")"
    silent="$(command -v ${1}__silent)"
    ("$@" 2>&1; echo $?) \
        | scmd_log.py "$time$def #" "$silent" >> "$SCMD_TMP/log.sh"
}

scmd_big_test_carousel() {
    echo "Hello there..." > /tmp/del-me
    seq 50 | while read -r line; do
        sleep 0.05
        head /tmp/del-me
        first="$(sed 's/\(.\).*/\1/' /tmp/del-me)"
        rest="$(sed 's/.\(.*\)/\1/' /tmp/del-me)"
        echo "$rest$first" > /tmp/del-me
    done
    rm /tmp/del-me
}
