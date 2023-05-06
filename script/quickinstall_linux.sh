#!/bin/bash

SCRIPT_PATH=$(realpath $0)
WORKSROOT=$(dirname $(dirname $SCRIPT_PATH))
sudo cp /etc/apt/sources.list /etc/apt/sources.list.org


#################################################################################
# APT SOURCE
#################################################################################
## TsingHua
# sudo sed -i 's/http:\/\/archive.ubuntu.com/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# sudo sed -i 's/http:\/\/security.ubuntu.com/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

## 中科大
sudo sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

sudo apt update;
sudo apt install -y android-sdk-libsparse-utils autoconf  autogen automake autopoint \
                    bc bison build-essential cmake curl device-tree-compiler flex \
                    g++ gcc gettext git global gperf intltool jq \
                    libcurl4-openssl-dev libcurses-ocaml-dev liblz4-tool libffi-dev \
                    libdist-zilla-plugin-localemsgfmt-perl liblocale-msgfmt-perl \
                    libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils \
                    lsb m4 make pkg-config python3 python3-dev python3-pip ruby ruby-dev tig \
                    squashfs-tools srecord subversion zip zlib1g-dev zsh autojump \
                    zsh-syntax-highlighting zsh-autosuggestions ripgrep


ln -s $(pwd)/working-in-wsl/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
chsh ${USER} -s /usr/bin/zsh

################################################################################
# nodejs + yarn 
################################################################################

mkdir -p "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
curl -O https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
tar xJvf node-v18.16.0-linux-x64.tar.xz -C "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
export PATH="${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/node-v18.16.0-linux-x64/bin}:$PATH"
npm config set registry https://registry.npmmirror.com

npm install --global neovim
npm install --global bash-language-server

npm install --global yarn
yarn config set registry https://registry.npmmirror.com

sudo gem install neovim


################################################################################
# neovim
################################################################################
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim -y
mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim/lua/plugin-config}"
ln -s ${WORKSROOT}/config/init.vim "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim
ln -s ${WORKSROOT}/config/coc-settings.json "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json
ln -s ${WORKSROOT}/config/lua "${XDG_DATA_HOME:-$HOME}"/.config/nvim/lua

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

