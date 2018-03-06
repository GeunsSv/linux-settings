#!/bin/bash

# prepare neccesary data and directory
if [[ ! -d ~/scripts/logs ]]; then
        mkdir ~/scripts/logs
fi
exec > ~/scripts/logs/degug-linux-settings.log 2>&1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# changes for git repositories
if [ "$1" == "git" ]
then
        echo "[alias]" >> $2/.git/config
        echo "        wip = log --abbrev-commit --oneline --graph --decorate" >> $2/.git/config
fi

# custumize linux to my personal taste
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

        if [[ ! -d ~/.config/autostart ]]; then
                mkdir ~/.config/autostart/
        fi

        cp $DIR/files/bash_aliases ~/.bash_aliases
        cp $DIR/files/vimrc ~/.vimrc
        cp $DIR/files/startup.sh ~/scripts/
        cp $DIR/files/close_all_windows.sh ~/scripts/
        cp $DIR/files/sh.desktop ~/.config/autostart/

        . ~/.bashrc
fi
