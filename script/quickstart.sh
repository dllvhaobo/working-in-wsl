#!/bin/bash

sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-sdk-libsparse-utils autoconf  autogen automake autopoint \
                    bc bison build-essential cmake curl device-tree-compiler flex \
                    g++ gcc gettext git global gperf intltool jq lib32stdc++6  \
                    libcurl4-openssl-dev libcurses-ocaml-dev liblz4-tool libffi-dev \
                    libdist-zilla-plugin-localemsgfmt-perl liblocale-msgfmt-perl \
                    libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils \
                    lsb m4 make pkg-config python3-dev python3-pip ruby ruby-dev tig \
                    squashfs-tools srecord subversion zip zlib1g-dev zsh autojump \
                    zsh-theme-powerlevel9k zsh-syntax-highlighting zsh-autosuggestions \
                    ripgrep


################################################################################
# nodejs + yarn 
################################################################################
curl -O https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
tar xJvf node-v18.16.0-linux-x64.tar.xz -C "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
export PATH="${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/node-v18.16.0-linux-x64/bin}:$PATH"
npm install yarn

################################################################################
# neovim 
################################################################################
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim -y
sudo npm install -g neovim
sudo npm install -g bash-language-server
pip3 install pynvim 
sudo gem install neovim

mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload

cp config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
ln -s $(pwd)/config/init.vim "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim
ln -s $(pwd)/config/coc-settings.json "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json
chsh $(USER) -s /usr/bin/zsh
