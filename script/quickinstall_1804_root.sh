#!/bin/bash 

set -ex 
INSTALL_DIR=$(pwd)
ROOT_DIR=$(dirname ${INSTALL_DIR})
export PATH="${XDG_DATA_HOME:-$HOME/.local/bin}":$PATH

echo "*********************************************************************************"
echo " Install System package "
echo "*********************************************************************************"
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-tools-fsutils autoconf autogen automake autopoint bc bison build-essential cmake curl device-tree-compiler flex g++ gcc gettext git global gperf intltool jq lib32ncurses5 lib32stdc++6 libcurl4-openssl-dev libcurses-ocaml-dev libdist-zilla-plugin-localemsgfmt-perl libffi-dev liblocale-msgfmt-perl liblz4-tool libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils lsb m4 make make pkg-config python-wand python3-dev python3-pip ruby ruby-dev squashfs-tools srecord subversion tig zip zlib1g-dev zsh

echo "*********************************************************************************"
echo " Python Pakcage Install "
echo "*********************************************************************************"

pip3 install PyYAML schema python-magic pyparsing pip_search BobBuildtool pynvim

echo "*********************************************************************************"
echo " Yarn install"
echo "*********************************************************************************"
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

echo "*********************************************************************************"
echo " nvim install "
echo "*********************************************************************************"
cd ${INSTALL_DIR}
tar zxf nvim-linux64-glibc-earlier.tar.gz
cp -rf nvim-linux64/*  "${XDG_DATA_HOME:-$HOME/.local/share}/"

echo "*********************************************************************************"
echo " vim-plug install "
echo "*********************************************************************************"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp ${INSTALL_DIR}/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload

echo "*********************************************************************************"
echo " nodejs install "
echo "*********************************************************************************"
tar xf node-v16.18.1-linux-x64.tar.xz
cp -rf node-v16.18.1-linux-x64/* "${XDG_DATA_HOME:-$HOME/.local}/"

echo "*********************************************************************************"
echo "ripgrep install"
echo "*********************************************************************************"
sudo dpkg -i ripgrep_13.0.0_amd64.deb

echo "*********************************************************************************"
echo "git make install"
echo "*********************************************************************************"
cd ${INSTALL_DIR}
tar zxf git-2.38.1.tar.gz
cd ${INSTALL_DIR}/git-2.38.1
./configure  --without-tcltk
make
sudo make install

echo "*********************************************************************************"
echo "global make install"
echo "*********************************************************************************"
cd ${INSTALL_DIR}
tar zxf global-6.6.8.tar.gz
cd ${INSTALL_DIR}/global-6.6.8/
./configure
make
sudo make install

echo "*********************************************************************************"
echo "ctags make install"
echo "*********************************************************************************"
cd ${INSTALL_DIR}
tar zxf ctags.tar.gz
cd ${INSTALL_DIR}/ctags-p5.9.20221106.0/
./autogen.sh
./configure
make
sudo make install

echo "coc extensions install"
echo "*********************************************************************************"
mkdir -p "${XDG_DATA_HOME:-$HOME}"/.config/coc/extensions
for i in $(ls ${INSTALL_DIR}/coc_extensions/*.tar.gz)
do
    echo $i
    tar zxvf $i -C "${XDG_DATA_HOME:-$HOME}"/.config/coc/extensions/
done

echo "*********************************************************************************"
echo "neovim plugin install"
echo "*********************************************************************************"
mkdir -p "${XDG_DATA_HOME:-$HOME}"/.config/nvim/
for i in $(ls ${INSTALL_DIR}/nvim_plugged/*.tar.gz)
do
    echo $i
    tar zxvf $i -C "${XDG_DATA_HOME:-$HOME}"/.config/nvim/plugged/
done

echo "*********************************************************************************"
echo "zsh and zsh-plugin install "
echo "*********************************************************************************"
cd ${INSTALL_DIR}
tar -zxf zsh-autosuggestion.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
tar -zxf zsh-syntax-highlighting.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
tar -zxf powerlevel9k.tar.gz -C  "${XDG_DATA_HOME:-$HOME/.local/share}"

echo "*********************************************************************************"
echo " autojump install"
echo "*********************************************************************************"
tar -zxf ${INSTALL_DIR}/autojump.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
ln -s  "${XDG_DATA_HOME:-$HOME/.local/share}"/autojump/autojump    "${XDG_DATA_HOME:-$HOME/.local}"/bin/autojump

echo "*********************************************************************************"
echo " yarn mirror"
echo "*********************************************************************************"
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

echo "*********************************************************************************"
echo " nodejs mirror"
echo "*********************************************************************************"
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

npm install -g neovim
npm install bash-language-server -g

ln -s ${ROOT_DIR}/configs/nvim/init.vim    "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim
ln -s ${ROOT_DIR}/configs/nvim/coc-settings.json    "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json
ln -s ${ROOT_DIR}/configs/zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
ln -s ${ROOT_DIR}/tools/adddns.sh "${XDG_DATA_HOME:-$HOME}"/adddns.sh
chsh $(USER) -s $(which zsh)
# ln -s ${ROOT_DIR}/configs/.gitconfig ${XDG_DATA_HOME:-$HOME/.gitconfig
