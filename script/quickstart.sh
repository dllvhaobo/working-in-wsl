#!/bin/bash

# VERSION=`cat /etc/issue |awk '/Ubuntu/{print $2}'`
SCRIPT_PATH=$(realpath $0)
WORKSROOT=$(dirname $(dirname $SCRIPT_PATH))

mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share/nvim/site/autoload}"
ln -s ${WORKSROOT}/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
ln -s ${WORKSROOT}/config/init.vim "${XDG_DATA_HOME:-$HOME}"/.config/nvim/init.vim
ln -s ${WORKSROOT}/config/coc-settings.json "${XDG_DATA_HOME:-$HOME}"/.config/nvim/coc-settings.json
ln -s ${WORKSROOT}/config/lua "${XDG_DATA_HOME:-$HOME}"/.config/nvim/lua
ln -s ${WORKSROOT}/config/git-commit-template.txt "${XDG_DATA_HOME:-$HOME}"/.git-commit-template.txt
ln -s ${WORKSROOT}/config/.gitconfig "${XDG_DATA_HOME:-$HOME}"/.gitconfig

echo "################################################################################"
echo "# vim-plug"
echo "################################################################################"
cp ${WORKSROOT}/config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    echo "# APT SOURCE"
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.org
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
                        lsb m4 make pkg-config python3 python3-dev python3-pip ruby ruby-dev \
                        squashfs-tools srecord  zip zlib1g-dev 

    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/lib/nodejs/}"

    echo "# IM-SELEC 输入法自动切换"
    # https://github.com/daipeihust/im-select/tree/master/macOS/out/intel
    cp ${WORKSROOT}/tools/im-select /usr/local/bin/im-select
    chmod 777 /usr/local/bin/im-select

elif [[ "$OSTYPE" == "darwin"* ]]; then

    echo "# IM-SELEC 输入法自动切换"
    # https://github.com/daipeihust/im-select/tree/master/macOS/out/intel
    cp ${WORKSROOT}/tools/im-select.macos /usr/local/bin/im-select
    chmod 777 /usr/local/bin/im-select

    #################################################################################
    ## xcode
    ##################################################################################
    xcode-select --install

    #################################################################################
    # Homebrew 中科大
    #################################################################################
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

    # 安装Homebrew
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
    /bin/bash brew-install/install.sh
    rm -rf brew-install

fi

${WORKSROOT}/script/zsh_install.sh
${WORKSROOT}/script/nodejs_install.sh
${WORKSROOT}/script/pip3_install.sh
${WORKSROOT}/script/neovim_install.sh
${WORKSROOT}/script/fzf_install.sh
${WORKSROOT}/script/pure_install.sh
# TIG
#
# rip-grep
#

