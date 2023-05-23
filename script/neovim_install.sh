#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "################################################################################"
    echo "# neovim"
    echo "################################################################################"
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt install neovim -y
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install neovim 
fi
