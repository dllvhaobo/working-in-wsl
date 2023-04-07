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
  - npm 国内源
  - yarn 国内源
  - neovim 安装及配置
  - vim-plug 插件管理器
  - clang 安装及配置
  - clang-format 安装及配置
- 国内访问
  - 安装包已经打包成 tar.gz，并在国内仓库进行维护，详情请查看[gitlink][]。
  - 位于 Github 上的项目已在[gitee][]上创建镜像。
- 说明文档

  - [QuickStart][./docs/quickstart.md]
  - [在线文档][readthedocs.io]
  - 也可以参照如下命令在本地生成文档查看。

    ```bash
    git clone https://github.com/dllvhaobo/working-in-wsl.git
    cd working-in-wsl
    pip install -r requirements.txt
    mkdocs serve
    ```

## MIRRORS

## APT

修改 /etc/apt/sources.list 文件，将其中的 http://archive.ubuntu.com 和 http://security.ubuntu.com 替换为你所在地区的镜像源。

例如，可以使用以下命令来修改为清华镜像源：

```bash
sudo sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
sudo sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
```

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

**NOTE**: Neovim 8.0 需要 GLIBC_2.29 或者更新的 lib 库支持。在低版本的 Ubuntu 系统中 Glibc 的版本与 Neovim 依赖版本不一致。
请使用 https://github.com/antoineco/neovim-neovim/releases发布的预编译版本。详见[GitHub Issue][githubissue]

[gitee]: https://gitee.com/dllvhaobo/dashboard/projects
[gitlink]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
[readthedocs.io]: https://workinginwsl.readthedocs.io
[im-select]: https://github.com/daipeihust/im-select
[githubissue]: https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
[neovim用户手册]: https://neovim.io/doc/user/
[neovim-install-from-package]: https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package
[package-for-ubuntu-18.04]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package/tree/main/nvim-linux64-glibc-earlier.tar.gz
[working-in-wsl-package]: https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git
