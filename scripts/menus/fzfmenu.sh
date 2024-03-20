#! /bin/bash

uxterm -xrm "Uxterm.vt100.allowTitleOps: false" -T "floating_xterm" -e "fzf $* < /proc/$$/fd/0 > /proc/$$/fd/1"
