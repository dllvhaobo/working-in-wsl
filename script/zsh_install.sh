#!/bin/bash
echo "################################################################################"
echo "# ZSH"
echo "################################################################################"
sudo apt install -y zsh
sudo apt install -y zsh-syntax-highlighting
sudo apt install -y zsh-autosuggestions
sudo apt install -y autojump
chsh ${USER} -s /usr/bin/zsh
