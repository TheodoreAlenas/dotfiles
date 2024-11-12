#!/bin/python3


def lemonbar_wrapper():
    while True:
        raw = None
        try:
            raw = input()
        except EOFError:
            raw = ""
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
            + " " * max(0, 30 - (raw_len - raw_end))
        print(final)


if __name__ == '__main__':
    lemonbar_wrapper()
