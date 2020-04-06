#!/bin/bash

# Packages
#
# mdp - Markdown previewer (mdp README.md)

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
    sudo apt-get install w3m links vim tmux wget python node git ssh tcpdump nmap man newsbeuter mdp weechat
fi

# Install Node Packages
npm install -g http-server
npm install -g how-2

# Install Python Packages
sudo easy_install pip
sudo pip install virtualenv
sudo pip install haxor-news --upgrade --ignore-installed six
sudo pip install pocket-cli
sudo pip install rtv

# Install custom apps
mkdir /apps/
git clone https://github.com/sunaku/dasht.git
mv dasht /apps/

export PATH=$PATH:/apps/dasht/bin
export MANPATH=/apps/dasht/man:$MANPATH
