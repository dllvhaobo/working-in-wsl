# 个人系统安装指南

## APPLICATION

- [AutoHotKey](docs/sys/keymap/autohotkey.md)
- [SharpKey](docs/sys/keymap/sharpkey.md)
- [字体](docs/sys/font.md)
- [WindowsTerminal](docs/sys/WindowsTerminal.md)

## WSL2

## VIM

## CLANG

结合个人工作需要记录在不同系统下（Windows，MacBook，Ubuntu，Manjaro）的与 Terminal 有关的系统以及软件配置，键盘映射等等。

_个人日常工作的主要环境是 WLS2+UBUNTU，关于`WSL2+UBUNTU`会经常进行更新，其他系统的配置不定期维护_

<!-- vim-markdown-toc GitLab -->

* [键盘映射](#键盘映射)
* [Ubuntu/WSL-UBUNTU](#ubuntuwsl-ubuntu)
    * [依赖](#依赖)
    * [字体](#字体)
    * [Neovim](#neovim)
        * [Install from Prebuild Neovim](#install-from-prebuild-neovim)
        * [Installation from Source Code](#installation-from-source-code)
        * [Neovim 插件](#neovim-插件)
            * [vim-plug](#vim-plug)
            * [Nodejs](#nodejs)
            * [Yarn](#yarn)
            * [Coc](#coc)
            * [Python3](#python3)
            * [Ruby](#ruby)
            * [Ctags](#ctags)
    * [Docker](#docker)
    * [Zsh](#zsh)
    * [WindowsTerminal](#windowsterminal)
    * [Vscode](#vscode)
    * [AutoHotKey](#autohotkey)
    * [SharpKey](#sharpkey)
    * [WSL](#wsl)
    * [Tmux](#tmux)
    * [Git](#git)
    * [SubVersion](#subversion)
* [Manjaro](#manjaro)
* [MACBOOK](#macbook)
    * [Neovim](#neovim-1)
    * [Zsh](#zsh-1)
    * [双系统时间同步](#双系统时间同步)
    * [Linux 平台输入法&中文字符](#linux-平台输入法中文字符)
    * [Linux 平台 ADB 配置](#linux-平台-adb-配置)
    * [tmux](#tmux-1)
    * [CLangFormat](#clangformat)
    * [golang](#golang)
* [加速访问](#加速访问)
    * [apt source](#apt-source)
    * [hosts](#hosts)
    * [npm&yarn](#npmyarn)
    * [coc mirrors](#coc-mirrors)
    * [vim-plug](#vim-plug-1)
    * [pip](#pip)
    * [docker](#docker-1)
    * [golang](#golang-1)
* [FAQ](#faq)
    * [Coc Language Server not found](#coc-language-server-not-found)
    * [LanguageClient not found](#languageclient-not-found)
    * [Docker for WSL2](#docker-for-wsl2)

<!-- vim-markdown-toc -->

## 键盘映射

通过软件或者系统高配置实现以下按键配置详见[keymap](./docs/keymap.md)页

- Switch `backspace` and `backslash`
- CapsLock only as `escape`
- CapsLock + `X` as `Ctrl+X`

## Ubuntu/WSL-UBUNTU

### 依赖

通过命令行安装必要的系统依赖。

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install git subversion g++ gcc clang-12 tig curl build-essential python3-pip ruby universal-ctags ruby-dev cmake build-essential autoconf  global ripgrep libtool libtool-bin make  automake tig gettext  pkg-config
```

### 字体

安装对应字体，并且在 Terminal 中选中安装的字体，可以在 Terminal 中现实 DevIcons，连体字,中文等等。[详见 Font 说明](./docs/fonts.md)

### Neovim

#### Install from Prebuild Neovim

比较推荐使用预编译好的二进制文件进行安装（针对 Ubuntu 环境）:

- For Ubuntu 20.04 and later:

  ```
  tar xzvf nvim-linux64.tar.gz;
  cp -rf nvim-linux64/* ~/.local/
  ```

- For Ubuntu 18.04 or elder:

  ```
  tar xzvf nvim-linux64-glibc-earlier.tar.gz;
  cp -rf nvim-linux64/* ~/.local/
  ```

**NOTE**: Neovim 8.0 需要 GLIBC_2.29 或者更新的 lib 库支持。在低版本的 Ubuntu 系统中 Glibc 的版本与 Neovim 依赖版本不一致。
请使用 https://github.com/antoineco/neovim-neovim/releases发布的预编译版本。详见[GitHub Issue][githubissue]

**NOTE**: 如果网络访问速度比较缓慢，请跳转到[加速访问](#加速访问)，参考设置镜像之后再进行安装

#### Installation from Source Code

```bash
git clone git@github.com:neovim/neovim.git
cd neovim/
sudo apt install cmake build-essential
sudo apt install automake autoconf
sudo apt install libtool
sudo apt install libtool-bin
sudo apt install gettext
make
sudo make install
```

#### Neovim 插件

插件安装有可能收到网络的限制，建议参考[本地安装指导](./non-root-install/readme.md#neovim)完成插件的安装及拷贝。如果使用本地安装，则可忽略本章节后续内容。

neovim 很多都依赖 npm，yarn 以及 github，如有必要请设置好代理。

1. 导入`init.vim`
2. 安装 vim-plug
3. 启动 vim 并执行`:PlugInstall`，等待安装完成
4. 安装 COC 组件

##### vim-plug

vim-plug 是 VIM 的包管理工具。通过 vim-plug 可以自动下载并加载 vim 的各种插件。

```bash
### Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

##### Nodejs

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt update && sudo apt install -y nodejs
sudo npm install -g neovim
sudo npm install -g bash-language-server
```

##### Yarn

```
## yarn install
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

##### Coc

```bash
cd ~/.config/nvim/plugged/coc.nvim
yarn install
```

##### Python3

```bash
sudo apt install python3-pip
pip3 install pynvim
```

##### Ruby

```bash
sudo apt install ruby-dev
sudo gem install neovim
```

##### Ctags

```bash
sudo apt install universal-ctags
```

WSL 与 UBUNTU 配置相同，参考[Ubuntu 配置](./ubuntu/readme.md#neovim安装及配置)

### Docker

Ubuntu 环境下安装 Docker-Engine 可以使用`scripts/docker_install.sh`直接进行安装。

### Zsh

- 快速补全
- 快速跳转
- 主题美化

参照如下命令安装 ZSH 组件, 拷贝 zshrc 到~/.zshrc

```bash
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel9k autojump
cp ./configs/zshrc ~/.zshrc
chsh -s /usr/local/share/zsh
```

WSL2 参考[Ubuntu 配置](./ubuntu/readme.md#Zsh)

Manjaro 和 MacBook 参考各自的 readme 进行安装.

### WindowsTerminal

打开 WindowsTerminal 的配置文件，使用如下配置替换 Action 部分。完整的 Windows Terminal 配置文件位于本仓库`windows/windowsTerminal_settings.json`，但是因为细节部分有出入，不建议直接拷贝覆盖。

```json
    "actions":
    [
        {
            "command":
            {
                "action": "switchToTab",
                "index": 3
            },
            "keys": "alt+4"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 0
            },
            "keys": "alt+1"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 7
            },
            "keys": "alt+8"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+1"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+2"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+3"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+4"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+5"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+6"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+7"
        },
        {
            "command": "unbound",
            "keys": "ctrl+alt+8"
        },
        {
            "command": "unbound",
            "keys": "alt+up"
        },
        {
            "command": "unbound",
            "keys": "ctrl+k"
        },
        {
            "command": "unbound",
            "keys": "alt+down"
        },
        {
            "command": "unbound",
            "keys": "alt+right"
        },
        {
            "command": "unbound",
            "keys": "alt+left"
        },
        {
            "command": "unbound",
            "keys": "backspace"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+w"
        },
        {
            "command": "unbound",
            "keys": "ctrl+v"
        },
        {
            "command": "unbound",
            "keys": "shift+insert"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 2
            },
            "keys": "alt+3"
        },
        {
            "command": "find",
            "keys": "ctrl+shift+f"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "up"
            },
            "keys": "alt+k"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 5
            },
            "keys": "alt+6"
        },
        {
            "command": "paste"
        },
        {
            "command":
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command":
            {
                "action": "splitPane",
                "split": "auto",
                "splitMode": "duplicate"
            },
            "keys": "alt+enter"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 1
            },
            "keys": "alt+2"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 4
            },
            "keys": "alt+5"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "right"
            },
            "keys": "alt+l"
        },
        {
            "command": "closePane",
            "keys": "alt+q"
        },
        {
            "command":
            {
                "action": "switchToTab",
                "index": 6
            },
            "keys": "alt+7"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "left"
            },
            "keys": "alt+h"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "down"
            },
            "keys": "alt+j"
        },
        {
            "command": "togglePaneZoom",
            "keys": "alt+f"
        }
    ],
```

### Vscode

目前 VScode 的配置已经可以通过 windows 或者 Github 同步了。但是收到网络的影响可能无法同步，可以 `config/code_settings.json`的配置建议只参考 vim 相关的配置，修改 vscode 的快捷键。

### AutoHotKey

Windows 上需要借助 AutoHotkey 软件时间按键映射。参考[keymap](./docs/keymap.md)

### SharpKey

[Deprecated]Sharpkey 可视化修改按键映射，同时写入 Windows 注册表。

### WSL

Windows 下使用 WSL2 运行 Docker Daemon（而非 Docker Desktop）,WSL2 中 Docker 的安装参考[Ubuntu 配置](./ubuntu/readme.md#docker安装及配置)

```raw
DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
sudo chgrp docker "$DOCKER_DIR"
sudo mkdir /etc/docker
sudo vim /etc/docker/daemon.json
```

添加如下内容：

```json
{
  "hosts": ["unix:///mnt/wsl/shared-docker/docker.sock"]
}
```

### Tmux

TO Continue

### Git

配置 git 的比对工具，用户名，邮件等相关内容，详见[gitconfig.md](./docs/gitconfig.md)

### SubVersion

通过命令行查看 SVN 的变更内容，需要对 svn 进行相关配置，详见[svnconfig](./docs/svn-config.md)

## Manjaro

====

## MACBOOK

---

### Neovim

```bash
xcode-select --install

brew install universal-ctags
brew install yarn
brew install node

/usr/bin/python3 -m pip install --upgrade pip
/usr/bin/python3 -m pip install pynvim
/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip

cd ~/.config/nvim/plugged/coc.nvim/
yarn install

```

### Zsh

参照如下命令安装 ZSH 组件, 拷贝 zshrc 到~/.zshrc

```bash
brew tap sambadevi/powerlevel9k
brew install powerlevel9k zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search autojump
chsh -s /usr/local/share/zsh
```

### 双系统时间同步

TODO

### Linux 平台输入法&中文字符

TODO

### Linux 平台 ADB 配置

TODO

### tmux

TODO

### CLangFormat

TODO

### golang

```bash
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/
go get golang.org/x/tools/gopls@latest
```

## 加速访问

### apt source

```bash
sudo sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
```

### hosts

系统配置过程中，有很多需要依赖于 Github 的访问，因为国内 DNS 污染的原因，需要手动配置 hosts 文件才能够正确的访问 github。参考[hosts](config/hosts)文件中关于 github 的配置，修改本地 HOSTS 文件.

- windows："C:\Windows\System32\drivers\etc\hosts"
- Ubuntu: "/etc/hosts"

查找 Github 与 IP 地址的映射关系，可以在网站https://www.ipaddress.com/上搜索如下三个网址的IP，将结果填写到Hosts文件中。

- github.com
- github.global.ssl.fastly.net
- assets-cdn.github.com

### npm&yarn

参照如下命令使用国内镜像。

```bash
yarn config set registry https://registry.npm.taobao.org --global  && \
yarn config set disturl https://npm.taobao.org/dist --global && \
yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass --global  && \
yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ --global  && \
yarn config set puppeteer_download_host https://npm.taobao.org/mirrors --global  && \
yarn config set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver --global  && \
yarn config set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver --global  && \
yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs --global  && \
yarn config set selenium_cdnurl https://npm.taobao.org/mirrors/selenium --global  && \
yarn config set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector --global


npm set registry https://registry.npm.taobao.org && \
npm set disturl https://npm.taobao.org/dist && \
npm set sass_binary_site https://npm.taobao.org/mirrors/node-sass && \
npm set electron_mirror https://npm.taobao.org/mirrors/electron && \
npm set puppeteer_download_host https://npm.taobao.org/mirrors && \
npm set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver && \
npm set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver && \
npm set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs && \
npm set selenium_cdnurl https://npm.taobao.org/mirrors/selenium && \
npm set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector && \
npm cache clean --force
```

### coc mirrors

Using custom registry
You can customize npm registry for coc.nvim by add coc.nvim:registry in the file ~/.npmrc:

```bash
coc.nvim:registry=https://registry.npmmirror.com/
```

### vim-plug

git@gitee.com:dllvhaobo/vim-startify.git
https://gitee.com/dllvhaobo/vim-airline.git

```bash
git@gitee.com:dllvhaobo/DoxygenToolkit.vim.git
git@gitee.com:dllvhaobo/LanguageClient-neovim.git
git@gitee.com:dllvhaobo/LeaderF-marks.git
git@gitee.com:dllvhaobo/LeaderF.git
git@gitee.com:dllvhaobo/coc-highlight.git
git@gitee.com:dllvhaobo/coc-jedi.git
git@gitee.com:dllvhaobo/coc.nvim.git
git@gitee.com:dllvhaobo/copilot.vim.git
git@gitee.com:dllvhaobo/defx.nvim.git
git@gitee.com:dllvhaobo/docker-compose.vim.git
git@gitee.com:dllvhaobo/fzf.git
git@gitee.com:dllvhaobo/fzf.vim.git
git@gitee.com:dllvhaobo/gruvbox.git
git@gitee.com:dllvhaobo/indentpython.vim.git
git@gitee.com:dllvhaobo/markdown-preview.nvim.git
git@gitee.com:dllvhaobo/neoformat.git
git@gitee.com:dllvhaobo/nerdcommenter.git
git@gitee.com:dllvhaobo/nvim-treesitter.git
git@gitee.com:dllvhaobo/open-browser.vim.git
git@gitee.com:dllvhaobo/plantuml-previewer.vim.git
git@gitee.com:dllvhaobo/plantuml-syntax.git
git@gitee.com:dllvhaobo/syntastic.git
git@gitee.com:dllvhaobo/tagbar.git
git@gitee.com:dllvhaobo/undotree.git
git@gitee.com:dllvhaobo/vim-airline.git
git@gitee.com:dllvhaobo/vim-devicons.git
git@gitee.com:dllvhaobo/vim-easy-align.git
git@gitee.com:dllvhaobo/vim-easymotion.git
git@gitee.com:dllvhaobo/vim-fugitive.git
git@gitee.com:dllvhaobo/vim-go.git
git@gitee.com:dllvhaobo/vim-instant-markdown.git
git@gitee.com:dllvhaobo/vim-lsp-cxx-highlight.git
git@gitee.com:dllvhaobo/vim-markdown-toc.git
git@gitee.com:dllvhaobo/vim-peekaboo.git
git@gitee.com:dllvhaobo/vim-polyglot.git
git@gitee.com:dllvhaobo/vim-prettier.git
git@gitee.com:dllvhaobo/vim-signify.git
git@gitee.com:dllvhaobo/vim-slumlord.git
git@gitee.com:dllvhaobo/vim-snippets.git
git@gitee.com:dllvhaobo/vim-startify.git
git@gitee.com:dllvhaobo/vim-surround.git
git@gitee.com:dllvhaobo/vim-table-mode.git
git@gitee.com:dllvhaobo/vim-visual-multi.git
git@gitee.com:dllvhaobo/vimspector.git
git@gitee.com:dllvhaobo/vimwiki.git
git@gitee.com:dllvhaobo/vista.vim.git
git@gitee.com:dllvhaobo/wildfire.vim.git
```

### pip

TODO

### docker

TODO

### golang

TODO

## FAQ

### Coc Language Server not found

`CocCommand clang.install`

### LanguageClient not found

PlugInstall 的步骤没有完全执行完就退出了，可能导致安装脚本没有执行。可以手动执行安装 `cd ~/.config/nvim/plugged/LanguageClient-neovim;./install.sh`

### Docker for WSL2

今天在更新了 WSL2 上的 Ubuntu22.04 版本，在安装 Docker 后无法启动，查看 Docker 的日志显示如下的错误.

```bash
INFO[2022-04-22T16:14:55.718999500+08:00] stopping event stream following graceful shutdown error="<nil>" module=libcontainerd namespace=moby
INFO[2022-04-22T16:14:55.719787400+08:00] stopping event stream following graceful shutdown error="context canceled" module=libcontainerd namespace=plugins.moby
INFO[2022-04-22T16:14:55.719906400+08:00] stopping healthcheck following graceful shutdown module=libcontainerd
failed to start daemon: Error initializing network controller: error obtaining controller instance: unable to add return rule in DOCKER-ISOLATION-STAGE-1 chain: (iptables failed: iptables --wait -A DOCKER-ISOLATION-STAGE-1 -j RETURN: iptables v1.8.7 (nf_tables): RULE_APPEND failed (No such file or directory): rule in chain DOCKER-ISOLATION-STAGE-1
(exit status 4))
```

原因是由于新的 ubuntu 系统使用了 iptables-nft，而 WSL2 不支持导致的。可以通过以下命令进行修改.

```bash
sudo update-alternatives --config iptables
There are 2 choices for the alternative iptables (providing /usr/sbin/iptables).

Selection Path Priority Status
------------------------------------------------------------
* 0 /usr/sbin/iptables-nft 20 auto mode
1 /usr/sbin/iptables-legacy 10 manual mode
2 /usr/sbin/iptables-nft 20 manual mode
Press <enter> to keep the current choice[*], or type selection number: 1

Press <enter> to keep the current choice[*], or type selection number: 1
update-alternatives: using /usr/sbin/iptables-legacy to provide /usr/sbin/iptables (iptables) in manual mode

```

[githubissue]: https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
[docker-install]: https://docs.docker.com/engine/install/ubuntu/
[use-docker-non-root]: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
[package_repo]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
