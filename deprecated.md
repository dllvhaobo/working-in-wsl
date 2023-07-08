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

# 说明文档

  - [QuickStart][./docs/quickstart.md]
  - [在线文档][readthedocs.io]
  - 也可以参照如下命令在本地生成文档查看。

    ```bash
    git clone https://github.com/dllvhaobo/working-in-wsl.git
    cd working-in-wsl
    pip install -r requirements.txt
    mkdocs serve
    ```
# VIM-PLUG 镜像仓库

必要的 VIM 插件已经同步到 Gitee。使用如下连接添加到`${MYVIMRC}`中。

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
