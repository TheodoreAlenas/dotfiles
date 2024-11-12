#!/bin/python3
import sys

def log_wrapper(prefix, is_silent):

    if is_silent:
        print(prefix + "- silent  |")
        exit(0)
    else:
        print(prefix + "0 started |")

    try:
        n = 1
        last = "SCMD RELATED ERROR"
        cur = ""
        while True:
            old = cur
            cur = input()
            last = old
            print(prefix + str(n) + " running |" + cur)
            n += 1
    except Exception:
        print(prefix + str(n-2) + " err " + cur.ljust(3) + " |" + last)


def main(argv):
    if len(argv) < 3:
        raise Exception(f"Usage: {argv[0]} PREFIX (silent|'')")
    log_wrapper(prefix=argv[1], is_silent=len(argv[2].strip()) > 0)


if __name__ == '__main__':
    main(sys.argv)
