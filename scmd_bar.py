#!/bin/python3


def lemonbar_wrapper():
    while True:
        raw = input()
        raw_end = raw.find("; } #")
        raw_len = len(raw)

        res = raw.replace("%", "%%")

        cmd_start = res.find("{")
        cmd_end = res.find("; } #", cmd_start)
        out_start = res.find("|", cmd_end)
        if cmd_start != -1 and cmd_end != -1 and out_start != -1:
            s1 = res[:cmd_start + 1]
            s2 = res[cmd_start + 1:cmd_end]
            s3 = res[cmd_end:out_start + 1]
            s4 = res[out_start + 1:]

            err_eq = s3.find("err=")
            if err_eq != -1 and s3[err_eq + 4] != '0':
                s = err_eq
                e = err_eq + 7
                s3 = s3[:s] + "%{F#f88}" + s3[s:e] + "%{F#667}" + s3[e:]
            
            res = \
                "%{F#667}" + s1 + "%{F-}" + s2 + \
                "%{F#667}" + s3 + "%{F-}" + s4

        res = "%{c}" + res + " " * max(0, 30 - (raw_len - raw_end))

        print(res)


if __name__ == '__main__':
    lemonbar_wrapper()
