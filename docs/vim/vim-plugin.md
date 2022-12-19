# Neovim 配置说明

## 插件说明

| 插件名                             | 启用状态 | 描述 |
| ---------------------------------- | -------- | ---- |
| 'vim-airline/vim-airline'          |          |      |
| 'tpope/vim-surround'               |          |      |
| 'junegunn/vim-peekaboo'            |          |      |
| 'easymotion/vim-easymotion'        |          |      |
| 'liuchengxu/vista.vim'             |          |      |
| 'dhruvasagar/vim-table-mode'       |          |      |
| 'iamcco/markdown-preview.nvim'     |          |      |
| 'Yggdroot/LeaderF'                 |          |      |
| 'Yggdroot/LeaderF-marks'           |          |      |
| 'junegunn/fzf'                     |          |      |
| 'junegunn/fzf.vim'                 |          |      |
| 'mhinz/vim-signify'                |          |      |
| 'tpope/vim-fugitive'               |          |      |
| 'preservim/nerdcommenter'          |          |      |
| 'junegunn/vim-easy-align'          |          |      |
| 'mbbill/undotree'                  |          |      |
| 'aklt/plantuml-syntax'             |          |      |
| 'weirongxu/plantuml-previewer.vim' |          |      |
| 'mg979/vim-visual-multi'           |          |      |
| 'autozimu/LanguageClient-neovim'   |          |      |
| 'neoclide/coc.nvim'                |          |      |
| 'honza/vim-snippets'               | not use  |      |
| 'ryanoasis/vim-devicons'           | not use  |      |
| 'tyru/open-browser.vim'            | not use  |      |
| 'puremourning/vimspector'          | not use  |      |
| 'skanehira/docker-compose.vim'     | not use  |      |
| 'neoclide/coc-highlight'           | not use  |      |
| 'jackguo380/vim-lsp-cxx-highlight' | not use  |      |
| 'sheerun/vim-polyglot'             | not use  |      |
| 'vim-syntastic/syntastic'          | not use  |      |
| 'majutsushi/tagbar'                | not use  |      |
| 'vim-scripts/indentpython.vim'     | not use  |      |
| 'vimwiki/vimwiki'                  | disabled |      |
| 'sbdchd/neoformat'                 | disabled |      |
| 'prettier/vim-prettier'            | disabled |      |
| 'scrooloose/vim-slumlord'          | disabled |      |
| 'mzlogin/vim-markdown-toc'         | disabled |      |
| 'Shougo/defx.nvim'                 | disabled |      |
| 'vim-scripts/DoxygenToolkit.vim'   | disabled |      |
| 'mhinz/vim-startify'               | disabled |      |
| 'gcmt/wildfire.vim'                | disabled |      |
| 'morhetz/gruvbox'                  | disabled |      |

## coc-extensions

coc-git
coc-explorer
coc-webview
coc-prettier
coc-vimlsp
coc-clang-format-style-options
coc-diagnostic
coc-marketplace
coc-syntax
coc-snippets
coc-yank
coc-json
coc-clangd
coc-pyright
coc-cmake
coc-groovy
coc-yaml

CocList exe
## coc-showdocuments

| 快捷键         | 动作                   |
| -------------- | ---------------------- |
| `<PageUp>`     | 帮助文档中上翻页       |
| `<PageDown`    | 帮助文档中下翻页       |

## coc-explorer

| 快捷键         | 动作                   |
| -------------- | ---------------------- |
| `<leader>` `e` | 打开侧边栏文件浏览器   |
| `l`            | 打开文件 或者 展开目录 |
| `h`            | 折叠目录 m             |
| `<bs>`         | 进入上级目录           |
| `e`            | 打开文件               |
| `E`            | 打开文件 vsplit        |
| `y` `p`        | copy path 拷贝文件路径 |
| `y` `n`        | copy name 拷贝文件名   |
| `E`            | 打开文件 vsplit        |
| `a`            | 创建文件               |
| `A`            | 创建目录               |
| `z` `h`        | 查看隐藏文件切换       |
| `d` `d`        | 剪切文件               |
| `d` `f`        | 删除文件到回收站       |
| `d` `F`        | 删除文件               |
| `r`            | 重命名                 |
| `p`            | 粘贴 m                 |

## vim-easy-align

| 快捷键      | 动作         |
| ----------- | ------------ |
| `g` `a` `=` | 对齐等号 "=" |
| `g` `a` ` ` | 对齐空格 " " |

## vim-surround

| 快捷键                             | 动作                               |
| ---------------------------------- | ---------------------------------- |
| `c` `s` `"` `'`                    | "hello" 替换成 'hello'             |
| `d` `s` `"`                        | "hello" 替换成 hello               |
| `y` `s` `w`                        | hello 替换成 "hello"               |
| `y` `s` `s`                        | 当前行的头和尾添加                 |
| `y` `S` `S`                        | 当前行的上和下添加                 |
| `d` `s` `t`                        | \<div>"hello"\</div>" 替换成 hello |
| `y` `s` `W` `f` `print` `<cr>`     | "hello" 替换成 print("hello")      |
| `y` `s` `W` `F` `print` `<cr>`     | "hello" 替换成 print( "hello" )    |
| `y` `s` `W` `<c-f>` `print` `<cr>` | "hello" 替换成 (print"hello")      |

## vim-visual-multi

| 快捷键     | 动作                                |
| ---------- | ----------------------------------- |
| `ctrl` `n` | 选取当前 word，并跳转到下一个匹配处 |
| `q`        | 跳转到下一个匹配处                  |
| `Q`        | 取消当前选取的 word                 |

## vim-table-mode

- 首行输入`列名`，并以`|`分割, 参考如下:

  ```bash
  | name1 | name2 | name 3 |
  ```

- 在列名称的上行或者下行，在输入模式下，输入两个`<BAR>`，比如：`|` `|` 。参考如下效果

  ```bash
  |-------|-------|--------|
  | name1 | name2 | name 3 |
  |-------|-------|--------|
  ```
        
- 转化CSV格式，将`value, value2, value3`转化成`| value | value2| value3 |`  

- 转化其他格式，比如，将`value; value2; value3`转化成`| value | value2| value3 |`, 输入`:tableize/;`, `/`之后指定分隔符，此处为`;`

| 快捷键                 | 动作              |
|------------------------|-------------------|
| `<leader>` `t` `m`     | 开启/关闭         |
| `<leader>` `t` `t`     | 转化CSV格式到表格 |
| `<leader>` `t` `d` `c` | 删除列            |
| `<leader>` `t` `d` `d` | 删除行            |
| `[` `<BAR>`            | 左移              |
| `]` `<BAR>`            | 左移              |
| `{` `<BAR>`            | 上移              |
| `}` `<BAR>`            | 下移              |

## makrdown-preview

| 快捷键             | 动作     |
|--------------------|----------|
| `<leader>` `m` `p` | 开启预览 |


## diff

在两个打开的文件中分别执行`diffthis`,则开启比较模式.

常用操作，分别在分屏的两侧打开两个文件，并在两个文件中执行`diffthis`，则开启竖屏比较模式.
