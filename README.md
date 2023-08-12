

记录日常工作中使用的工具及配置。包含 neovim,git,键盘映射,wsl2,clangd,tmux, WindowsTerminal,Vscode,网络配置 等等。

## 快速安装

可以执行如下脚本快速完成安装步骤以及配置文件的部署。

_NOTE:如果收到网络影响过程中有单独的安装组件失败，可以在 script 目录下下执行相应的安装脚本_

```bash
git clone git@gitee.com:dllvhaobo/working-in-wsl.git
working-in-wsl/script/quick_linux.sh
```
- [fonts](./docs/fonts.md)
- [WIndowsSubSystemLinux](./docs/WSL.md)

## HOSTS

系统配置过程中，有很多需要依赖于 Github 的访问，因为国内 DNS 污染的原因，需要手动配置 hosts 文件才能够正确的访问 github。参考`config/hosts`文件中关于 github 的配置，修改本地 HOSTS 文件. HOSTS 文件的位置如下：

- windows："C:\Windows\System32\drivers\etc\hosts"
- Ubuntu: "/etc/hosts"

查找 Github 与 IP 地址的映射关系，可以在网站`https://www.ipaddress.com`上搜索如下三个网址的 IP，将结果填写到 Hosts 文件中。

- github.com
- github.global.ssl.fastly.net
- assets-cdn.github.com

**NOTE**: Neovim 8.0 需要 GLIBC_2.29 或者更新的 lib 库支持。在低版本的 Ubuntu 系统中 Glibc 的版本与 Neovim 依赖版本不一致。
请使用 https://github.com/antoineco/neovim-neovim/releases发布的预编译版本。详见[GitHub Issue][githubissue]

WSL2

WINDWOS-TERMINAL

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

## 应用说明

### Autojump

`j <目录缩写> ` 可以快速跳转到深层目录。配合 ZSH-AUTOSUGGESUTION，可以非常方便的在常用目录之间跳转，详见 GIF

### FZF

`Alt+C` list 当下目录的子目录并跳转
`CTRL+R` 快速历史命令匹配

### COC

### VIM

### IM-SELECT

在 VIM 中输入中文的辅助插件：

- 在 INSERT-MODE 的时候，可以输出中文
- 退出 VIM 的 INSERT MODE 的时候，自动切换会英文输入法

### Clang

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

[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[输入法自动切换参考]: https://github.com/daipeihust/im-select#to-get-current-keyboard-locale和https://www.science.co.il/language/Locale-codes.php
[vscode 的 vim 输入插件]: https://github.com/VSCodeVim/Vim#input-method
