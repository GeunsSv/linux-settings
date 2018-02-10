#!/bin/bash


if [ "$1" == "git" ]
then
        echo "[alias]" >> $2/.git/config
        echo "        wip = log --abbrev-commit --oneline --graph --decorate" >> $2/.git/config
fi

if [ "$1" == "linux" ]
then
        # Insert neccesary info for spotify-client
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
                --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
        echo deb http://repository.spotify.com stable non-free | \
                sudo tee /etc/apt/sources.list.d/spotify.list

        sudo apt-get update && sudo apt-get -y upgrade
        sudo apt install -y wmctrl terminator thunderbird spotify-client sl
        sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        sudo apt-get update
        sudo apt install -y docker-ce

        mkdir ~/.config/autostart/

        cp ./files/bash_aliases ~/.bash_aliases
        cp ./files/vimrc ~/.vimrc
        cp ./files/startup.sh ~/
        cp ./files/sh.desktop ~/.config/autostart/

        . ~/.bashrc
fi
