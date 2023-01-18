## APT

```bash
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-sdk-libsparse-utils
sudo apt install -y autoconf
sudo apt install -y autogen
sudo apt install -y autojump
sudo apt install -y automake
sudo apt install -y autopoint
sudo apt install -y bc
sudo apt install -y bison
sudo apt install -y build-essential
sudo apt install -y cmake
sudo apt install -y curl
sudo apt install -y device-tree-compiler
sudo apt install -y flex
sudo apt install -y g++
sudo apt install -y gcc
sudo apt install -y gettext
sudo apt install -y git
sudo apt install -y global
sudo apt install -y gperf
sudo apt install -y intltool
sudo apt install -y jq
sudo apt install -y lib32stdc++6
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libcurses-ocaml-dev
sudo apt install -y libdist-zilla-plugin-localemsgfmt-perl
sudo apt install -y libffi-dev
sudo apt install -y liblocale-msgfmt-perl
sudo apt install -y liblz4-tool
sudo apt install -y libmount-dev
sudo apt install -y libncurses5-dev
sudo apt install -y libtool
sudo apt install -y libtool-bin
sudo apt install -y libxml2-utils
sudo apt install -y lsb
sudo apt install -y m4
sudo apt install -y make
sudo apt install -y pkg-config
sudo apt install -y python3-dev
sudo apt install -y python3-pip
sudo apt install -y ruby
sudo apt install -y ruby-dev
sudo apt install -y squashfs-tools
sudo apt install -y srecord
sudo apt install -y subversion
sudo apt install -y tig
sudo apt install -y zip
sudo apt install -y zlib1g-dev
sudo apt install -y zsh
sudo apt install -y zsh-autosuggestions
sudo apt install -y zsh-syntax-highlighting
sudo apt install -y zsh-theme-powerlevel9k
```

## ZSH

```bash
ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
chsh lv -s /usr/bin/zsh
```

## NEOVIM

neovim 是 vim 的一个分支，其特性是 vim 的超集，操作与 VIM 几乎完全兼容。快速安装请参考如下步骤。详细信息请参考[neovim][]和[neovim.io][]

```bash
# Copy VIMRC
sudo apt-get install software-properties-common
#sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim

mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
ln -s $(pwd)/config/init.vim ~/.config/nvim/init.vim
```

## NODEJS

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt install -y yarn nodejs
```

设置NPM和YARN国内镜像

```bash
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

## VIM-PLUG

我们使用 vim-plug 作为 neovim 的插件管理器, 快速安装请参考如下步骤。详细信息请参考[vim-plug][]

```bash
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
```

## 安装插件-本地解压

受到网络的影响，在线安装非常慢并且不稳定。所有的插件都已经同步到国内仓库，可以使用如下步骤安装。

```bash
git clone https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git package
cd package/vim-plug
./unpack.sh
```

## 安装插件-在线下载

neovim 安装完成之后，拷贝`config/init.vim`到`~/.config/nvim/init.vim`之后，执行`nvim -c PlugInstall -c quit -c quit`等待插件安装完成。

## 安装 COC EXTENSIONS

在 init.vim 中定义好的 extensions，在 neovim 启动的时候，会自动进行安装。如果希望手动安装其他 COC 扩展，可以通过`CocList marketplace`选择需要的扩展进行安装。

[universal-ctags]: https://github.com/universal-ctags/ctags
[neovim]: https://github.com/neovim/neovim
[vim-plug]: https://github.com/junegunn/vim-plug
[coc.nvim]: https://github.com/neoclide/coc.nvim
[neovim.io]: http://neovim.io/
