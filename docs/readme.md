
## gtags

```bash
## https://ftp.gnu.org/pub/gnu/global/

sudo apt install libncurses5-dev
tar -zxf global-6.6.8.tar.gz
cd global-6.6.8
./configure --prefix="${XDG_DATA_HOME:-$HOME/.local}"
make install
```

## ctags

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
