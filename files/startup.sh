#!/bin/bash

wmctrl -n 5

wmctrl -s 0
terminator --maximise --borderless &
sleep 1
wmctrl -s 1
firefox &
sleep 2
wmctrl -s 2
thunderbird &
sleep 5
wmctrl -s 3
spotify &
