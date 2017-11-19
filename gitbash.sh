#!/bin/bash


if [ "$1" == "git" ]
then
        echo "[alias]" >> $2/.git/config
        echo "        wip = log --abbrev-commit --oneline --graph --decorate" >> $2/.git/config
fi

if [ "$1" == "linux" ]
then
        cp ./files/bash_aliases ~/.bash_aliases
        cp ./files/vimrc ~/.vimrc
fi
