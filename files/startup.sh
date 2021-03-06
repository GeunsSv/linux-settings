#!/bin/bash

if [[ ! -d $HOME/scripts/logs ]]; then
        mkdir $HOME/scripts/logs
fi
exec > $HOME/scripts/logs/startup.log 2>&1

wmctrl -s 0
terminator -m -b -l my-layout &
sleep 1
wmctrl -s 1
firefox &
sleep 2
wmctrl -s 2
thunderbird &
sleep 4
wmctrl -s 3
spotify &
