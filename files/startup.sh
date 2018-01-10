#!/bin/bash

#2. Launch programs in these terminals
terminator --maximise --borderless &
firefox &
thunderbird &
spotify &

sleep 10

wmctrl -r "terminator" -t 0
wmctrl -r "firefox" -t 1
wmctrl -r "thunderbird" -t 2
wmctrl -r "spotify" -t 3
