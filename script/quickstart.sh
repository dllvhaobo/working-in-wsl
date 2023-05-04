#!/bin/bash

sudo sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-sdk-libsparse-utils autoconf  autogen automake autopoint \
                    bc bison build-essential cmake curl device-tree-compiler flex \
                    g++ gcc gettext git global gperf intltool jq lib32stdc++6  \
                    libcurl4-openssl-dev libcurses-ocaml-dev liblz4-tool libffi-dev \
                    libdist-zilla-plugin-localemsgfmt-perl liblocale-msgfmt-perl \
                    libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils \
                    lsb m4 make pkg-config python3-dev python3-pip ruby ruby-dev tig \
                    squashfs-tools srecord subversion zip zlib1g-dev zsh autojump \
                    zsh-syntax-highlighting zsh-autosuggestions ripgrep

ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
chsh ${USER} -s /usr/bin/zsh

################################################################################
# nodejs + yarn 
################################################################################
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt install -y yarn nodejs
yarn config set registry https://registry.npmmirror.com
npm config set registry https://registry.npmmirror.com

################################################################################
# npm installation 
################################################################################
npm install neovim
npm install bash-language-server
sudo gem install neovim

################################################################################
# neovim
################################################################################
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim -y
mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
ln -s $(pwd)/working-in-wsl/config/init.vim "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim
ln -s $(pwd)/working-in-wsl/config/coc-settings.json "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json

################################################################################
# pynvim 
################################################################################
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple 
pip3 install --upgrade pip  
pip3 install pynvim 

################################################################################
# vim-plug 
################################################################################
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp $(pwd)/working-in-wsl/config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload

################################################################################
# fzf:  https://github.com/junegunn/fzf.git
################################################################################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

################################################################################
# Theme pure:https://github.com/sindresorhus/pure.git
################################################################################
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

