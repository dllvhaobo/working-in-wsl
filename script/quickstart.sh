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
<<<<<<< HEAD
curl -O https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
tar xJvf node-v18.16.0-linux-x64.tar.xz -C "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"
export PATH="${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/node-v18.16.0-linux-x64/bin}:$PATH"
npm install yarn
||||||| 583d003
curl -fsSL https://deb.nodesource.com/setup_18.x |  \
    sudo -E bash - && sudo apt-get install -y nodejs

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg \
    | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | \
    sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt install -y yarn nodejs

npm set registry https://registry.npm.taobao.org
npm set disturl https://npm.taobao.org/dist
npm set sass_binary_site https://npm.taobao.org/mirrors/node-sass
npm set electron_mirror https://npm.taobao.org/mirrors/electron
npm set puppeteer_download_host https://npm.taobao.org/mirrors
npm set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver
npm set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver
npm set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs
npm set selenium_cdnurl https://npm.taobao.org/mirrors/selenium
npm set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector
npm set coc.nvim:registry https://registry.npmjs.org/
npm cache clean --force

yarn config set registry https://registry.npm.taobao.org --global
yarn config set disturl https://npm.taobao.org/dist --global
yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass --global
yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ --global
yarn config set puppeteer_download_host https://npm.taobao.org/mirrors --global
yarn config set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver --global
yarn config set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver --global
yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs --global
yarn config set selenium_cdnurl https://npm.taobao.org/mirrors/selenium --global
yarn config set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector --global
=======
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt install -y yarn nodejs
yarn config set registry https://registry.npmmirror.com
npm config set registry https://registry.npmmirror.com
>>>>>>> 6c9338cc1514bd8968671a130459fbfe70e169b3

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

