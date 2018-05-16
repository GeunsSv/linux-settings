#!/bin/bash

set -x

# prepare neccesary data and directory
if [[ ! -d $HOME/scripts/logs ]]; then
        mkdir -p $HOME/scripts/logs
fi
if [[ -f $HOME/scripts/logs/settings.log ]]; then
        rm $HOME/scripts/logs/settings.log
fi
exec &> >(tee -a "$HOME/scripts/logs/settings.log")
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Custumize linux to my personal taste

## Insert neccesary info for spotify-client
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | \
        sudo tee /etc/apt/sources.list.d/spotify.list

## Update and upgrade, install programs
sudo apt-get update && sudo apt-get -y upgrade
sudo apt install -y wmctrl terminator thunderbird spotify-client sl flashplugin-installer
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

## Add docker info to repositories and install it
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt install -y docker-ce

## Make sure the autostart folder exists for the startup script
if [[ ! -d $HOME/.config/autostart ]]; then
        mkdir -p $HOME/.config/autostart/
fi
if [[ ! -d $HOME/.config/terminator ]]; then
        mkdir -p $HOME/.config/terminator/
fi

# complete the firefox Dockerfile
# $DIR/files/complete-firefox-dockerfile.sh $DIR

# sudo usermod -aG docker $USER
# sudo service docker restart

# build the firefox image
# docker build -t firefox $DIR/files/firefox/

# create the firefox container
# docker run --name firefox -tid -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host --pid=host --ipc=host firefox

## Copy all files
cp $DIR/files/bashrc $HOME/.bashrc
cp $DIR/files/bash_aliases $HOME/.bash_aliases
cp $DIR/files/vimrc $HOME/.vimrc
cp $DIR/files/startup.sh $HOME/scripts/
cp $DIR/files/close_all_windows.sh $HOME/scripts/
cp $DIR/files/sh.desktop $HOME/.config/autostart/
cp $DIR/files/terminator.config $HOME/.config/terminator/config

. $HOME/.bashrc

set +x
