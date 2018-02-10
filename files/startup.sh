#!/bin/bash

wmctrl -n 5

wmctrl -s 0
terminator -m -b -l my-1st-layout &
sleep 1
wmctrl -s 1
google-chrome &
sleep 2
wmctrl -s 2
thunderbird &
sleep 4
wmctrl -s 3
spotify &
