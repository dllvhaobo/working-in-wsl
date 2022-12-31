## APT

```bash
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt install -y android-sdk-libsparse-utils autoconf  autogen automake autopoint \
                    bc bison build-essential cmake curl device-tree-compiler flex \
                    g++ gcc gettext git global gperf intltool jq lib32stdc++6  \
                    libcurl4-openssl-dev libcurses-ocaml-dev liblz4-tool libffi-dev \
                    libdist-zilla-plugin-localemsgfmt-perl liblocale-msgfmt-perl \
                    libmount-dev libncurses5-dev libtool libtool-bin libxml2-utils \
                    lsb m4 make pkg-config python3-dev python3-pip ruby ruby-dev tig \
                    squashfs-tools srecord subversion zip zlib1g-dev zsh autojump \
                    zsh-theme-powerlevel9k zsh-syntax-highlighting zsh-autosuggestions
```

## ZSH

```bash
ln -s $(pwd)/config/.zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
chsh lv -s /usr/bin/zsh
```


## Neovim

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
## Nodejs

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt install -y yarn nodejs
```

## Nodejs Mirror

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

## 插件管理器 Vim-Plug

我们使用 vim-plug 作为 neovim 的插件管理器, 快速安装请参考如下步骤。详细信息请参考[vim-plug][]

```bash
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp config/plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
```

## 安装插件

neovim 安装完成之后，拷贝`config/init.vim`到`~/.config/nvim/init.vim`之后，执行`nvim -c PlugInstall -c quit -c quit`等待插件安装完成。


## 安装 COC Extensions

在 init.vim 中定义好的 extensions，在 neovim 启动的时候，会自动进行安装。如果希望手动安装其他 COC 扩展，可以通过`CocList marketplace`选择需要的扩展进行安装。

[universal-ctags]: https://github.com/universal-ctags/ctags
[neovim]: https://github.com/neovim/neovim
[vim-plug]: https://github.com/junegunn/vim-plug
[coc.nvim]: https://github.com/neoclide/coc.nvim
[neovim.io]: http://neovim.io/
