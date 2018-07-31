#!/bin/bash

echo "Installing Apps..."

if [ "$(uname)" == "Darwin" ]; then
    # Mac
    echo "Running Mac"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew install tmux w3m node rtv newsbeuter
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    echo "Running Linux"
    sudo apt-get install w3m links vim tmux wget python node git ssh tcpdump nmap man newsbeuter
    pip install rtv
fi

# Install Node Packages
npm install -g http-server

# Install Python Packages
sudo easy_install pip
sudo pip install virtualenv
sudo pip install haxor-news --upgrade --ignore-installed six
sudo pip install pocket-cli

