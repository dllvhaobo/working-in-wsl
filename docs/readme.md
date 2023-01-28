# README

- [QuickInstall](#quickinstall)
- [Prepare](#prepare)
- [dependency](#dependency)
- [neovim](#neovim)
  - [vim-plug](#vim-plug)
  - [Nodejs](#nodejs)
  - [Python](#python)
  - [copy-plugin](#copy-plugin)
  - [gtags](#gtags)
  - [ctags](#ctags)
  - [ripgrep](#ripgrep)
- [Git](#git)
- [ZSH](#zsh)
- [关闭 PowerLevel9K 的检查 GIT 更新 Option](#关闭-powerlevel9k-的检查-git-更新-option)
- [SSH 登录](#ssh-登录)

<!-- vim-markdown-toc -->

## QuickInstall

QuickInstall 可以完成所有相关配置，可以忽略后续的章节。

受到各种原因的限制，目前的开发环境只能是基于 UBUNTU-18.04.5 的环境。基于此目前可以使用以下三种方式搭建环境。

### gtags

Gtags 也就是 GNU GLOBAL，是一个非常强大的源码符号索引工具。它通过建立索引数据库，不但可以查找函数的定义，还可以查找函数的所有引用（被调用的地方）；而且它还可以增量地更新索引数据库，当代码有所改变时，它可以在很短的时间内更新索引数据库，保持索引数据库和代码同步。

LeaderF 可以自己管理 gtags 数据库（GTAGS，GRTAGS，GPATH），它不会在你的项目目录下生成任何额外的文件或目录。gtags 数据库文件存储在$HOME/.LfCache/gtags/%PATH%OF%YOUR%PROJECT/下面， %PATH%OF%YOUR%PROJECT 是把你项目路径中的 \ 或 / 替换成 %。

只要设置 let g:Lf_GtagsAutoGenerate = 1， LeaderF 就会在打开第一个文件时自动生成 gtags 数据库。当代码有更改并且已经有 gtags 数据库生成时，更改的代码会自动同步到 gtags 数据库（即使 g:Lf_GtagsAutoGenerate 是 0）。

只有在项目根目录下有 g:Lf_RootMarkers（默认值是['.git', '.hg', '.svn']）里面指定的文件或目录时，LeaderF 才会自动生成 gtags 数据库；否则只能手动生成 gtags 数据库：Leaderf gtags --update，但是当代码有更改时，gtags 数据库依然可以自动更新。

Leaderf gtags 使用介绍，具体使用方法可以用:Leaderf gtags -h 来查看。

```bash
## https://ftp.gnu.org/pub/gnu/global/

sudo apt install libncurses5-dev
tar -zxf global-6.6.8.tar.gz
cd global-6.6.8
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}"
make install
```

## ctags

vista 插件依赖'universal-ctags'.

```bash
##https://github.com/universal-ctags/ctags
tar -zxf ctags.tar.gz
cd ctags
./autogen.sh
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}"
make install
```

## ripgrep

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
