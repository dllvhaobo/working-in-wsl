#!/bin/bash
# Replace the url in /etc/apt/sources.list to "mirrors.ustc.edu.cn"

# general
sudo apt update
sudo apt upgrade -y
sudo apt install git subversion libtool make g++ gcc clang-12 automake tig gettext curl build-essential pkg-config python3-pip ruby universal-ctags ruby-dev cmake build-essential automake autoconf libtool libtool-bin gettext global ripgrep

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# npm install
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# yarn install 
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y nodejs yarn 

# npm yarn mirror
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

npm config set registry https://registry.npm.taobao.org 
npm config set disturl https://npm.taobao.org/dist 
npm config set sass_binary_site https://npm.taobao.org/mirrors/node-sass 
npm config set electron_mirror https://npm.taobao.org/mirrors/electron 
npm config set puppeteer_download_host https://npm.taobao.org/mirrors 
npm config set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver 
npm config set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver 
npm config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs 
npm config set selenium_cdnurl https://npm.taobao.org/mirrors/selenium 
npm config set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector 
npm cache clean --force

sudo npm install -g neovim
sudo npm install -g bash-language-server
sudo pip3 install pynvim 
sudo gem install neovim

echo "********************************************************************************"
echo ' cd ~/.config/nvim/plugged/coc.nvim/; yarn install'
echo ' restart neovim, coc plugin will automatically install'
echo "********************************************************************************"
nvim -c PlugInstall -c q -c q
cd ~/.config/nvim/plugged/coc.nvim/; yarn install
nvim -c CocUpdate


mkdir -p ~/.config/nvim
ln -s ~/works/system_config/configs/init.vim ~/.config/nvim/init.vim
ln -s ~/works/system_config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
