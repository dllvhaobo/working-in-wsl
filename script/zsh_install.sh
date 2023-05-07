#!/bin/bash
echo "################################################################################"
echo "# ZSH"
echo "################################################################################"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VERSION=`cat /etc/issue |awk '/Ubuntu/{print $2}'`
    AUTOJUMP=`apt search autojump | awk '/autojump/{print $1}'`
    ZSH_AUTOSUGGESTIONS=`apt search zsh-autosuggestions | awk '/zsh-autosuggestions/{print $1}'`
    ZSH_SYNTAX_HIGHLIGHTING=`apt search zsh-syntax-highlighting | awk '/zsh-syntax-highlighting/{print $1}'`

    echo "################################################################################"
    echo "# ZSH"
    echo "################################################################################"
    echo "Install zsh from APT..."
    sudo apt install -y zsh

    echo "################################################################################"
    echo "# autojump"
    echo "################################################################################"
    if [[ "$AUTOJUMP" == "autojump"* ]]; then
        echo "Install autojump from APT..."
        sudo apt install -y autojump
    else
        echo "Install autojump from github..."
        git clone git://github.com/wting/autojump.git "${XDG_DATA_HOME:-$HOME/.local/share}/autojump"
        ${XDG_DATA_HOME:-$HOME/.local/share}/autojump/install.py
        rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/autojump"
    fi

    echo "################################################################################"
    echo "# zsh-autosuggestions"
    echo "################################################################################"
    if [[ "$ZSH_AUTOSUGGESTIONS" == "zsh-autosuggestions"* ]]; then
        echo "Install zsh-autosuggestions from APT..."
        sudo apt install -y zsh-autosuggestions
    else
        echo "Install zsh-autosuggestions from github..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${XDG_DATA_HOME:-$HOME/.local/share}/zsh-autosuggestions"
    fi

    echo "################################################################################"
    echo "# zsh-syntax-highlighting"
    echo "################################################################################"
    if [[ "$ZSH_SYNTAX_HIGHLIGHTING" == "zsh-syntax-highlighting"* ]]; then
        echo "Install zsh-syntax-highlighting from APT..."
        sudo apt install -y zsh-syntax-highlighting
    else
        echo "Install zsh-syntax-highlighting from github..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${XDG_DATA_HOME:-$HOME/.local/share}/zsh-syntax-highlighting"
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    brew install autojump
    brew install zsh-syntax-highlighting
    brew install zsh-autosuggestions
fi
