## 安装WindowsTerminal
## 配置按键映射
## 安装WSL2+Linux内核更新包
## 安装Linux发行版
## 更新APT源，安装APT包

```bash
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-sdk-libsparse-utils autoconf autogen automake autopoint bc bison build-essential cmake curl device-tree-compiler flex g++ gcc gettext git global gperf intltool jq  lib32stdc++6 libcurl4-openssl-dev libcurses-ocaml-dev libdist-zilla-plugin-localemsgfmt-perl libffi-dev liblocale-msgfmt-perl liblz4-tool libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils lsb m4 make pkg-config  python3-dev python3-pip ruby ruby-dev squashfs-tools srecord subversion tig zip zlib1g-dev zsh
```

## ZSH

```bash
sudo apt install -y autojump zsh-theme-powerlevel9k zsh-syntax-highlighting zsh zsh-au
ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
chsh lv -s /usr/bin/zsh
```

## Nodejs

```bash

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

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
```

## NEOVIM

## COC


: 1672412852:0;cd 
: 1672412854:0;cd works/working-in-wsl
: 1672412856:0;cd ..
: 1672412859:0;tar zxf neovim.tar.gz
: 1672412863:0;cd neovim
: 1672412863:0;ls
: 1672412873:0;ll
: 1672412880:0;vim README.md
: 1672412886:0;cat README.md
: 1672412899:0;make CMAKE_BUILD_TYPE=Release
: 1672412911:0;git switch master
: 1672412917:0;git pull
: 1672412965:0;make CMAKE_BUILD_TYPE=Release
: 1672412977:0;rm build 
: 1672412980:0;rm -rf build 
: 1672412982:0;make CMAKE_BUILD_TYPE=Release
: 1672413001:0;make clean 
: 1672413004:0;make CMAKE_BUILD_TYPE=Release
: 1672413029:0;cat README.md
: 1672413060:0;git status 
: 1672413069:0;git clean -df
: 1672413073:0;make CMAKE_BUILD_TYPE=Release
: 1672413085:0;ls -alt
: 1672413087:0;mkdir build
: 1672413090:0;make CMAKE_BUILD_TYPE=Release
: 1672413105:0;git status 
: 1672413111:0;git reset --hart
: 1672413112:0;git reset --hard
: 1672413125:0;make CMAKE_BUILD_TYPE=Release
: 1672413139:0;rm .deps -rf
: 1672413143:0;make CMAKE_BUILD_TYPE=Release
: 1672413497:0; sudo make install
: 1672413505:0;nvim
: 1672413526:0;cd ..
: 1672413526:0;ls
: 1672413527:0;cd working-in-wsl
: 1672413528:0;ls
: 1672413579:0;cat script/quickinstall_1804_root.sh
: 1672413643:0;mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
: 1672413669:0; cp config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
: 1672413672:0;nvim 
: 1672413696:0;cd cp ${INSTALL_DIR}/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
: 1672413714:0;cd "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
: 1672413716:0;ls
: 1672413725:0;nvim 
: 1672413778:0;ls -al
: 1672413802:0;cd 
: 1672413806:0;ls
: 1672413813:0;cd works/working-in-wsl
: 1672413814:0;ls
: 1672413817:0;cd docs
: 1672413818:0;ls
: 1672413820:0;cd ..
: 1672413820:0;ls
: 1672413831:0;cd script
: 1672413837:0;ll
: 1672413842:0;cat quickinstall_1804_root.sh
: 1672413956:0; cd ../config
: 1672413956:0;ls
: 1672414090:0;cd 
: 1672414091:0;ls
: 1672414093:0;cd .local
: 1672414093:0;ls
: 1672414094:0;cd ..
: 1672414102:0;mkdir .config
: 1672414104:0;cd .config
: 1672414145:0;mkdir nvim
: 1672414243:0;cp ~/works/working-in-wsl/config/init.vim ~/.config/nvim
: 1672414248:0;nvim 
: 1672414270:0;nvim
: 1672415511:0;nvim 
: 1672415905:0;pip3 install pynvim
: 1672415916:0;nvim
: 1672439392:0;nvim 
: 1672439462:0;cd 
: 1672439468:0;vim .zsh_history
: 1672439694:0;j wsl
: 1672439696:0;nvim 
