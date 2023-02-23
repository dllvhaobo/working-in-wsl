#!/bin/bash

# brew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew mirrors change to TsingHua
cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
brew update


brew install neovim
brew install ripgrep
brew install zsh 
brew install zsh-autosuggestions
brew install autojump
brew install zsh-syntax-highlighting
brew install bat
brew tap sambadevi/powerlevel9k
brew install sambadevi/powerlevel9k/powerlevel9k@0.6.7
brew install yarn
brew install global
pip3 install pynvim
sudo npm install -g neovim

# npm mirrors
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

# yarn mirrors
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

# vim-plug
mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


git clone https://github.com/dllvhaobo/working-in-wsl.git 
cd working-in-wsl
ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc 
ln -s $(pwd)/config/init.vim "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim 
ln -s $(pwd)/config/coc-settings.json  "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json
ln -s $(pwd)/config/config/.gitconfig "${XDG_DATA_HOME:-$HOME}"/
