#!/bin/sh
scrot -z -s -F "-" | xclip -i -t "image/png" -selection "clipboard"
