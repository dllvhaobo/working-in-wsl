<!-- vim-markdown-toc GFM -->

* [QuickInstall](#quickinstall)
* [Prepare](#prepare)
* [dependency](#dependency)
* [neovim](#neovim)
    * [vim-plug](#vim-plug)
    * [Nodejs](#nodejs)
    * [Python](#python)
    * [copy-plugin](#copy-plugin)
    * [gtags](#gtags)
    * [ctags](#ctags)
    * [ripgrep](#ripgrep)
* [Git](#git)
* [ZSH](#zsh)
* [关闭 PowerLevel9K 的检查 GIT 更新 Option](#关闭-powerlevel9k-的检查-git-更新-option)
* [SSH 登录](#ssh-登录)

<!-- vim-markdown-toc -->

## QuickInstall

QuickInstall 可以完成所有相关配置，可以忽略后续的章节。

受到各种原因的限制，目前的开发环境只能是基于 UBUNTU-18.04.5 的环境。基于此目前可以使用以下三种方式搭建环境。

- SSH 登录编译服务器，参考如下脚本进行服务器配置。

  ```bash
  git clone git@cnninvmgtlb01:lv_h1/syscfg.git
  cd syscfg/non-root-install
  ./quickinstall_1804_non_root.sh
  ```

- WSL2 + Ubuntu18.04，参考如下脚本进行服务器配置。

  ```bash
  git clone git@cnninvmgtlb01:lv_h1/syscfg.git
  cd syscfg/non-root-install
  ./quickinstall_1804_root.sh
  ```

- Docker + Ubuntu18.04 镜像，启动 docker 镜像，参考`docker_config.sh`配置用户；然后参考 WSL2 的配置脚本即可。

## Prepare

```bash
mkdir -p ${XDG_DATA_HOME:-$HOME/.local}/share
mkdir -p ${XDG_DATA_HOME:-$HOME/.local}/bin
mkdir -p ${XDG_DATA_HOME:-$HOME/.local}/lib

git clone git@cnninvmgtlb01:lv_h1/syscfg.git`
```

## dependency

目前服务器所有依赖已装备，可跳过。

```bash
sudo apt install git make g++ gcc clang-12 automake build-essential python3-pip cmake automake autoconf libncurses5-dev libdist-zilla-plugin-localemsgfmt-perl liblocale-msgfmt-perl gettext
```

## neovim

```bash
tar -zxf nvim-linux64-glibc-earlier.tar.gz
tar -zxf config.tar.gz
cp -rf  nvim-linux64/* "${XDG_DATA_HOME:-$HOME/.local}"
cp -rf config   "${XDG_DATA_HOME:-$HOME/.local/share}"/.config
```

### vim-plug

```bash
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
```

### Nodejs

```bash
tar -xf node-v16.18.1-linux-x64.tar.xz
cp -rf node-v16.18.1-linux-x64/bin "${XDG_DATA_HOME:-$HOME/.local}"
cp -rf node-v16.18.1-linux-x64/lib "${XDG_DATA_HOME:-$HOME/.local}"
cp -rf node-v16.18.1-linux-x64/share "${XDG_DATA_HOME:-$HOME/.local}"
```

### Python

Python 的 neovim 组件

```bash
pip3 install pynvim --user
```

### copy-plugin

```bash
mkdir -p "${XDG_DATA_HOME:-$HOME}"
cp -rf config  "${XDG_DATA_HOME:-$HOME}"/.config
cd "${XDG_DATA_HOME:-$HOME}"/.config/

## coc-extension
cd "${XDG_DATA_HOME:-$HOME}"/.config/coc/extensions
./package.sh unzip
rm -f *.tar.gz

## vim-plugin
cd "${XDG_DATA_HOME:-$HOME}"/.config/nvim/plugged/
./package.sh upzip
rm -f *.tar.gz
```

### gtags

```bash
## https://ftp.gnu.org/pub/gnu/global/

sudo apt install libncurses5-dev
tar -zxf global-6.6.8.tar.gz
cd global-6.6.8
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}"
make install
```

### ctags

```bash
##https://github.com/universal-ctags/ctags
tar -zxf ctags.tar.gz
cd ctags
./autogen.sh
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}"
make install
```

### ripgrep

用于全局搜索的 LeaderF 需要依赖 ripgrep 进行搜索。

```bash
dpkg -x ripgrep_13.0.0-2ubuntu0.1_amd64.deb ./
cp ./usr/bin/rg "${XDG_DATA_HOME:-$HOME/.local/bin/}"
```

## Git

```bash
tar -zxf git-2.38.1.tar.gz
cd  git-2.38.1
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}" --without-tcltk
make install
```

## ZSH

使用 ZSH 替代 Bash，并安装插件。支持：

- 根据历史自动补全（ctrl+space）
- 快速目录跳转(`j myfolder` //夸目录跳转）
- Terminal 美化主题

```bash
tar -zxf zsh-autosuggestion.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
tar -zxf zsh-syntax-highlighting.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
tar -zxf powerlevel9k.tar.gz -C  "${XDG_DATA_HOME:-$HOME/.local/share}"
tar -zxf autojump.tar.gz -C "${XDG_DATA_HOME:-$HOME/.local/share}"
ln -s  "${XDG_DATA_HOME:-$HOME/.local/share}"/autojump/autojump    "${XDG_DATA_HOME:-$HOME/.local}"/bin/autojump
cp ../configs/zshrc "${XDG_DATA_HOME:-$HOME}"/.zshrc
```

## 关闭 PowerLevel9K 的检查 GIT 更新 Option

大型工程强烈建议参考如下配置修改`${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel9k/powerlevel9k.zsh-theme`，否则进入 GIT 仓库的目录会非常的卡顿。

```zsh
# zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-changes false

# defined POWERLEVEL9K_VCS_GIT_HOOKS || POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
defined POWERLEVEL9K_VCS_GIT_HOOKS || POWERLEVEL9K_VCS_GIT_HOOKS=(git-tagname)
```

## SSH 登录

```
ssh -t -p 2222 $USER@10.70.9.60  "zsh -l"
```
