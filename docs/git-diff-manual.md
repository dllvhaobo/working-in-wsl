# README

- 在 VIM 的 TAB 中打开 git 工程目录中的所有改动。
- 在 Meld 中查看所有的 git 改动。

## 配置 GIT

`.gitconfig`中配置 git 的 diff 和 merge 时候使用的工具。

```bash
[diff]
    tool = vimdiff
    ; tool = meld
[difftool]
	prompt = false
[alias]
	d = difftool
[core]
    editor = nvim
[difftool "vimdiff"]
    path = /home/lv/.local/bin/nvim
[merge]
	tool = vimdiff
	conflictstyle = diff3
[mergetool]
	prompt = false
```

## VIM

### 以串行方式在VIM中比对修改的文件

```bash
git difftool ./
```

### 在VIM的Tabs中打开所有的改动文件。

- 安装gitdiffall，并进行相关配置，详见[gitdiffall] 

  ```bash
  git clone https://github.com/bootleq/vim-gitdiffall.git
  cd vim-gitdiffall
  
  # 修改install.zsh，配置安装目录，比如(~/.local/bin)
  ./install.zsh

  # 修改~/.zshrc文件，添加如下内容。
  if [ -e ~/.local/bin/gitdiffall.zsh ]; then
    source ~/.local/bin/gitdiffall.zsh
  fi
  ```

- 配置`~/.local/bin/gitdiffall.rb`

  ```rb
  config = ({
    :editor_cmd     => 'nvim',
    :max_files      => 40,
    :min_hash_abbr  => 5,
    :ignore_pattern => /\.(png|jpg)\Z/i
  }).merge!(defined?(CONFIG) ? CONFIG : {})
  ```

- 在zsh中执行`gitdiffall`，在VIM的Tabs中打开所有的改动文件。

## MELD

- 启动 X11Server

  - WINDOWS 10, 启动 X11-Server 的客户端程序(VcXsrv, MobaXterm, WindTerm)并进行相关配置。
  - WINDOWS 11, Windwos11 集成了 X11Server，详见[WSLG]。
  - 原生 Linux 不需要进行额外配置。

- 配置 Terminal 的 DISPLAY 环境变量
    - 配置环境变量 `export DISPLAY=YOUR_IP:1.0`
    - 启动xclock，查看是否能够在本机显示。 

- 在工作目录中执行`git difftool --dir-diff ./`，meld的会在本机显示。

[wslg]: https://github.com/microsoft/wslg
[xorg]: https://wiki.archlinuxcn.org/wiki/Xorg
[wayland]: https://wiki.archlinuxcn.org/wiki/Wayland
[gitdiffall]:https://github.com/bootleq/vim-gitdiffall
