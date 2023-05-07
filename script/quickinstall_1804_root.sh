#!/bin/bash 

set -x 
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

