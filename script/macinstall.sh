#!/bin/bash

#################################################################################
# 配置好Github的网络代理
#################################################################################

#################################################################################
# clone配置
#################################################################################
git clone https://github.com/dllvhaobo/working-in-wsl.git 

#################################################################################
## xcode
##################################################################################
xcode-select --install

#################################################################################
# Homebrew 清华mirror
#################################################################################
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"

# 安装Homebrew
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
/bin/bash brew-install/install.sh
rm -rf brew-install

# 安装homebrew的应用
brew install zsh
brew install pure
brew install neovim 
brew install autojump
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install node@18
brew install yarn

#################################################################################
# PIP3 使用清华 MIRRORS
#################################################################################
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install --upgrade pip
pip3 install pynvim

#################################################################################
# vim-plug插件管理器
#################################################################################
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#################################################################################
# IM-SELEC 输入法自动切换
#################################################################################
# https://github.com/daipeihust/im-select/tree/master/macOS/out/intel
cp tools/im-select.macos /usr/local/bin/im-select
chmod 777 /usr/local/bin/im-select

#################################################################################
# FZF
#################################################################################
git clone https://github.com/junegunn/fzf.git
cd fzf
./install

# Link config
mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
ln -s $(pwd)/config/init.vim "${XDG_DATA_HOME:-$HOME}/.config/nvim/init.vim"
ln -s $(pwd)/config/coc-settings.json "${XDG_DATA_HOME:-$HOME}/.config/nvim/coc-settings.json"
