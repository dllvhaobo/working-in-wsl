# Working In WSL

本人日常使用 Windows 作为工作环境，使用 WSL2 替换虚拟机，使用 WindowsTerminal 作为虚拟终端。该项目用于维护和记录个人工作环境的配置。主要包括 neovim，git，zsh，key-remap，clangd，wsl2 等相关配置。

在 Windows 系统环境中，使用 WSL2 替代虚拟机；使用 WindowsTerminal 作为终端模拟器；使用 Neovim，vim-plug 构建开发环境

- Windows 环境配置
  - WSL2 安装及配置
  - DevIcon 字体安装
  - 修改键盘布局
  - WindowsTerminal 配置
  - VsCode 配置
- Ubuntu 环境配置
  - apt 国内源
  - pip 国内源
  - npm&yarn 国内源
  - clang 安装及配置
  - clang-format 安装及配置
- 国内访问
  - 安装包已经打包成 tar.gz，并在国内仓库进行维护，详情请查看[gitlink][]。
  - 位于 Github 上的项目已在[gitee][]上创建镜像。

## 快速安装

可以执行如下脚本快速完成安装步骤以及配置文件的部署。如果收到网络影响过程中有单独的安装组件失败，可以在script下执行相应的安装步骤。

- `nvim -c PlugInstall`
```bash
git clone git@gitee.com:dllvhaobo/working-in-wsl.git
working-in-wsl/script/quick_linux.sh
```

## 键位修改

各个系统（windows，ubuntu，manjaro，MacBook）的方案各有不同。具体方案请参考[remap-caps-lock-to-escape-and-control][]

Features:

- Switch `backspace` and `backslash`
- CapsLock to Escape on tapped
- CapsLock to Left_Control on hold

### Windows

[AutoHotkey] 是一个自由、开源的宏生成器和自动化软件工具，它让用户能够自动执行重复性任务。AutoHotkey 可以修改任何应用程序的用户界面（例如，把默认的 Windows 按键控制命令替换为 Emacs 风格）。它是由定制的脚本语言驱动，旨在提供键盘快捷键或热键。

这里使用 AutoHotkey 将`Caps`映射成为`Ctrl`和`ESC`按键。只需要将`config/caps2escape.ahk`拷贝到`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

- 单独按压`Caps`映射成为`ESC`
- `Caps`+`其他按键`，`Caps`映射成为`Ctrl`

关于 AutoHotkey 的其他使用方法可以参考

- [AutoHotkey:常用技巧分享][]
- [AutoHotkey 官网][autohotkey]

### Ubuntu

执行`apt install -y xcape gnome-tweaks`安装"xcape"和"gnome-tweaks"。然后参考如下步骤完成设置，详情请参考[Remapping Caps Lock to Control and Escape][]

- Select checkbox `CapsLock as Ctrl` in `Gnome-tweaks->Keyboard & Mouse->Addtional Layout Options-> Control Position`.
- Append `xcape -e '#66=Escape'` to ~/.profile

### Mackbook

- 下载[karabiner](https://karabiner-elements.pqrs.org/)
- karabiner 的配置文件位于`~/.config/karabiner/karabiner.json`
- 参考如下`./config/karabiner.json`, 拷贝`Profile`下`rules`到 karabiner 的配置文件中相应位置

### Manjaro

拷贝 xmodemaprc 到根目录`cp config/xmodmap ~/xmodmaprc`,并且将如下内容拷贝到`~/.profile`文件的最后。详情可以参照[setxkbmap][]

```bash
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xmodmap ~/xmodmaprc
```

## 字体安装

安装对应字体，并且在 Terminal 中选中安装的字体，可以在 Terminal 中现实 DevIcons，连体字,中文等等。

- Windows 环境下直双击字体进行安装

  - 如果使用 WindowsTerminal 作为终端应用，需要在`[外观->字体]`中选择对应的字体。

- Ubuntu 中参照如下步骤安装字体

  ```bash
  mkdir ~/.fonts
  cp fonts ~/.fonts -rf
  fc-cache -f -v
  ```

  **NOTE**: 推荐两种字体二选一，只有这两种字体支持中文。

- `Caskaydia Cove ExtraLight Nerd Font Complete Windows Compatible.otf`
- `DejaVu Sans Mono Nerd Font Complete.ttf`

_希望安装其他字体的可以到 [nerd-fonts][] 去寻找自己喜欢的字体，并参照上述步骤进行安装_

## MIRRORS

### APT

修改 /etc/apt/sources.list 文件；例如，可以使用以下命令来修改为中科大镜像源：

```bash
sudo sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
```

### NPM&YARN

配置 YARN 的国内镜像。

```bash
yarn config set registry https://registry.npmmirror.com
npm config set registry https://registry.npmmirror.com
```

### PIP

```bash
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
python3 -m pip install --upgrade pip
```

### HOSTS

系统配置过程中，有很多需要依赖于 Github 的访问，因为国内 DNS 污染的原因，需要手动配置 hosts 文件才能够正确的访问 github。参考`config/hosts`文件中关于 github 的配置，修改本地 HOSTS 文件. HOSTS 文件的位置如下：

- windows："C:\Windows\System32\drivers\etc\hosts"
- Ubuntu: "/etc/hosts"

查找 Github 与 IP 地址的映射关系，可以在网站`https://www.ipaddress.com`上搜索如下三个网址的 IP，将结果填写到 Hosts 文件中。

- github.com
- github.global.ssl.fastly.net
- assets-cdn.github.com

**NOTE**: Neovim 8.0 需要 GLIBC_2.29 或者更新的 lib 库支持。在低版本的 Ubuntu 系统中 Glibc 的版本与 Neovim 依赖版本不一致。
请使用 https://github.com/antoineco/neovim-neovim/releases发布的预编译版本。详见[GitHub Issue][githubissue]

## NEOVIM

NEOVIM 的安装可以参考以下三种方法之一进行安装，新手推荐使用”快速安装“

### 快速安装

UBUNTU 环境下可以通过`apt install neovim`完成安装。Ubuntu 软件包管理策略比较保守，通常不会使用最新的版本，如果希望使用最新的版本，还是需要通过从源代码编译的方式进行安装。

### 下载源码安装

下载源码自行编译安装，通过源码安装可以随时更新代码，安装最新的版本，获取更新的特性支持。

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/full/path/
make install
```

### 使用预编译版本

在默写情况下，受到用户权限的限制，不能使用 APT 的方式进行安装，也无法安装编译时需要使用的依赖动态库。因此需要使用预先编译好的文件进行安装。

```bash
INSTALL_DIR=$(pwd)
export PATH="${XDG_DATA_HOME:-$HOME/.local/bin}":$PATH

git clone https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git
cd working-in-wsl-package

# For Ubuntu 18.04 or earlier verison:
tar zxf nvim-linux64-glibc-earlier.tar.gz

# For Ubuntu 22.04 or later version:
# tar zxf nvim-linux64.tar.gz

cp -rf nvim-linux64/*  "${XDG_DATA_HOME:-$HOME/.local/share}/"
```

WSL2

WINDWOS-TERMINAL

## IM-SELECT

`cp tools/im-select.macos /usr/local/bin/im-select`

VIM-PLUG

## VSCODE

在 VSCODE 使用 VIM 的快捷键配置。 拷贝如下配置到文件`%APPDATA%\Code\User\settings.json`

参考：

- [Vscode 的 VIM 输入插件][]
- [输入法自动切换参考][]

```json
{
    "workbench.colorTheme": "Default Dark+",
    "security.workspace.trust.untrustedFiles": "open",
    "workbench.iconTheme": "vscode-icons",
    "remote.SSH.remotePlatform": {
        "10.70.9.60": "linux",
        "10.70.9.60(2222)": "linux"
    },
    "explorer.confirmDelete": false,
    "editor.largeFileOptimizations": false,
    "vim.argumentObjectClosingDelimiters": [
        ")",
        "]",
        "}"
    ],
    "vim.argumentObjectOpeningDelimiters": [
        "(",
        "[",
        "{"
    ],
    "vim.autoSwitchInputMethod.obtainIMCmd": "C:\\Users\\lv_h1\\tools\\im-select.exe",
    "vim.autoSwitchInputMethod.enable": true,
    "vim.hlsearch": true,
    "vim.leader": "<space>",
    "vim.useSystemClipboard": true,
    "vim.autoSwitchInputMethod.defaultIM": "1033",
    "vim.autoSwitchInputMethod.switchIMCmd": "C:\\Users\\lv_h1\\tools\\im-select.exe {im}",
    "vim.easymotion": true,
    "vim.easymotionKeys": "hklyuiopnmqwertzxcvbasdgjf",
    "vim.highlightedyank.enable": true,
    "vim.normalModeKeyBindings": [
        {
          "before": ["<leader>", "s", "l"],
          "commands": [":vsplit"]
        },
        {
          "before": ["S"],
          "commands": [":w"]
        },
        {
          "before": ["Q"],
          "commands": [":q"]
        },
        {
          "before": [ "s", "j"],
          "commands": [
            ":split"
        ]
        },
        {
          "before": [ "s", "l"],
          "commands": [
            ":vsplit"
        ]
        }
      ],
      "vim.normalModeKeyBindingsNonRecursive": [

        {
          "before": ["<c-j>"],
          "after": ["5", "j"]
        },
        {
          "before": ["<c-k>"],
          "after": ["5", "k"]
        },
        {
          "before": ["<leader>", "w", "h"],
          "after": ["<c-w>", "h"]
        },
        {
          "before": ["<leader>", "w", "l"],
          "after": ["<c-w>", "l"]
        }
      ],
      "vim.visualModeKeyBindingsNonRecursive": [
        {
          "before": ["<c-j>"],
          "after": ["5", "j"]
        },
        {
          "before": ["<c-k>"],
          "after": ["5", "k"]
        }
    ],
    "vim.commandLineModeKeyBindingsNonRecursive": [

    ],
    "vim.handleKeys": {

        "<C-d>": true,
        "<C-s>": false,
        "<C-z>": false
    },
    "explorer.confirmDragAndDrop": false,
    "git.confirmSync": false,
    "git.autofetch": true
}
}
```

COC

FZF

`Alt+C` list 当下目录的子目录并跳转
`CTRL+R` 快速历史命令匹配

```bash
git clone --depth 1  https://github.com/junegunn/fzf.git  ~/.fzf
.fzf/install
```

### AUTOJUMP

```bash
git clone https://github.com/wting/autojump.git
autojump/install.py
echo  '[[ -s "${XDG_DATA_HOME:-$HOME}"/.autojump/etc/profile.d/autojump.sh ]] && source "${XDG_DATA_HOME:-$HOME}"/.autojump/etc/profile.d/autojump.sh' >> "${XDG_DATA_HOME:-$HOME}"/.zshrc
```

### GIT

```bash
tar zxf git-2.40.1.tar.gz
cd git-2.40.1
 ./configure --prefix=${HOME}/.local/
make install
```

NODEJS

YARN

PIP

## Clang

在 CMakeLists.txt 中添加 set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
在命令行中添加-DCMAKE_EXPORT_COMPILE_COMMANDS=on

https://apt.llvm.org/
https://clang.llvm.org/docs/ClangFormatStyleOptions.html
https://clang.llvm.org/docs/JSONCompilationDatabase.html
https://clangd.llvm.org/config.html#compilationdatabase
https://gitee.com/dllvhaobo/coc-clangd/blob/master/README.md
https://gitee.com/dllvhaobo/dashboard/projects
https://github.com/daipeihust/im-select
https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package
https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git
https://neovim.io/doc/user/
https://workinginwsl.readthedocs.io
https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package/tree/main/nvim-linux64-glibc-earlier.tar.gz
https://chromium.googlesource.com/chromium/src/+/refs/heads/main/styleguide/styleguide.md
https://clangd.llvm.org/extensions.html
https://developers.google.com/protocol-buffers/
https://docs.microsoft.com/en-us/visualstudio/ide/editorconfig-code-style-settings-reference
https://firefox-source-docs.mozilla.org/code-quality/coding-style/index.html
https://github.com/capnproto/capnproto/blob/master/kjdoc/tour.md#maybes
https://github.com/capnproto/capnproto/blob/master/style-guide.md
https://github.com/clangd/clangd/issues/987
https://github.com/clangd/coc-clangd
https://google.github.io/styleguide/cppguide.html
https://llvm.org/docs/CodingStandards.html
https://llvm.org/docs/CodingStandards.html#include-style
https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html
https://sci-hub.st/10.1109/IEEESTD.2018.8299595
https://standards.ieee.org/ieee/1800/6700/
https://www.gnu.org/prep/standards/standards.html
https://www.webkit.org/coding/coding-style.html

[remap-caps-lock-to-escape-and-control]: https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control
[setxkbmap]: https://my.oschina.net/swanf/blog/1549976
[remapping caps lock to control and escape]: https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way/228379#228379
[autohotkey:常用技巧分享]: https://zhuanlan.zhihu.com/p/103357456
[autohotkey]: https://github.com/AutoHotkey/AutoHotkey
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[输入法自动切换参考]: https://github.com/daipeihust/im-select#to-get-current-keyboard-locale和https://www.science.co.il/language/Locale-codes.php
[vscode 的 vim 输入插件]: https://github.com/VSCodeVim/Vim#input-method
