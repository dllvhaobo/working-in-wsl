#!/bin/bash
echo "################################################################################"
echo "# nodejs + yarn" 
echo "################################################################################"

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
