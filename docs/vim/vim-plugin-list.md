# Neovim 配置说明

```bash
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
cp plug.vim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
```

## 插件说明

| 插件名                             | 启用状态 |
| ---------------------------------- | -------- |
| 'vim-airline/vim-airline'          | selected |
| 'tpope/vim-surround'               | selected |
| 'junegunn/vim-peekaboo'            | selected |
| 'easymotion/vim-easymotion'        | selected |
| 'liuchengxu/vista.vim'             | selected |
| 'dhruvasagar/vim-table-mode'       | selected |
| 'iamcco/markdown-preview.nvim'     | selected |
| 'Yggdroot/LeaderF'                 | selected |
| 'Yggdroot/LeaderF-marks'           | selected |
| 'junegunn/fzf'                     | selected |
| 'junegunn/fzf.vim'                 | selected |
| 'mhinz/vim-signify'                | selected |
| 'tpope/vim-fugitive'               | selected |
| 'preservim/nerdcommenter'          | selected |
| 'junegunn/vim-easy-align'          | selected |
| 'mbbill/undotree'                  | selected |
| 'aklt/plantuml-syntax'             | selected |
| 'weirongxu/plantuml-previewer.vim' | selected |
| 'mg979/vim-visual-multi'           | selected |
| 'autozimu/LanguageClient-neovim'   | selected |
| 'neoclide/coc.nvim'                | selected |
| 'honza/vim-snippets'               | not use  |
| 'ryanoasis/vim-devicons'           | not use  |
| 'tyru/open-browser.vim'            | not use  |
| 'puremourning/vimspector'          | not use  |
| 'skanehira/docker-compose.vim'     | not use  |
| 'neoclide/coc-highlight'           | not use  |
| 'jackguo380/vim-lsp-cxx-highlight' | not use  |
| 'sheerun/vim-polyglot'             | not use  |
| 'vim-syntastic/syntastic'          | not use  |
| 'majutsushi/tagbar'                | not use  |
| 'vim-scripts/indentpython.vim'     | not use  |
| 'vimwiki/vimwiki'                  | disabled |
| 'sbdchd/neoformat'                 | disabled |
| 'prettier/vim-prettier'            | disabled |
| 'scrooloose/vim-slumlord'          | disabled |
| 'mzlogin/vim-markdown-toc'         | disabled |
| 'Shougo/defx.nvim'                 | disabled |
| 'vim-scripts/DoxygenToolkit.vim'   | disabled |
| 'mhinz/vim-startify'               | disabled |
| 'gcmt/wildfire.vim'                | disabled |
| 'morhetz/gruvbox'                  | disabled |

| Original | Target |
|-|-|
| Neo-tree | coc-explorer|


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


## Lazy Plugins

  Installed (2)
    ○ flash.nvim  VeryLazy   s S r R <c-s>
    ○ vim-fugitive 

  Updates (1)
    ○ neo-tree.nvim   Neotree   <leader>fe <leader>fE <leader>e <leader>E

  Clean (3)
    ○ flit.nvim 
    ○ leap.nvim 
    ○ vim-repeat 

  Loaded (19)
    ● LazyVim 3.75ms  start
    ● LuaSnip 19.9ms ✔  build
    ● alpha-nvim 1.84ms  VimEnter
    ● bufferline.nvim 3.38ms  VeryLazy
    ● friendly-snippets 14.39ms   LuaSnip
    ● gruvbox.nvim 0.07ms colorscheme gruvbox   LazyVim
    ● lazy.nvim 120041.53ms   init.lua
    ● lualine.nvim 3.68ms  VeryLazy
    ● mini.ai 17.21ms  VeryLazy
    ● mini.comment 0.72ms  VeryLazy
    ● mini.pairs 1.58ms  VeryLazy
    ● noice.nvim 1.1ms  VeryLazy
    ● nui.nvim 0.08ms   noice.nvim
    ● nvim-notify 1.53ms   noice.nvim
    ● nvim-treesitter 10.01ms   nvim-notify
    ● nvim-treesitter-textobjects 0.1ms   mini.ai
    ● tokyonight.nvim 3.29ms colorscheme tokyonight
    ● vim-surround 0.55ms  start
    ● which-key.nvim 10.29ms   mini.ai

  Not Loaded (29)
    ○ catppuccin 
    ○ cmp-buffer   nvim-cmp
    ○ cmp-nvim-lsp   nvim-cmp
    ○ cmp-path   nvim-cmp
    ○ cmp_luasnip   nvim-cmp
    ○ dressing.nvim 
    ○ gitsigns.nvim  BufReadPre BufNewFile
    ○ indent-blankline.nvim  BufReadPost BufNewFile
    ○ mason-lspconfig.nvim   nvim-lspconfig
    ○ mason.nvim   Mason   <leader>cm   null-ls.nvim
    ○ mini.bufremove   <leader>bd <leader>bD
    ○ mini.indentscope  BufReadPre BufNewFile
    ○ mini.surround   gza gzd gzf gzF gzh gzr gzn
    ○ neoconf.nvim   Neoconf   nvim-lspconfig
    ○ neodev.nvim   nvim-lspconfig
    ○ null-ls.nvim  BufReadPre BufNewFile
    ○ nvim-cmp  InsertEnter
    ○ nvim-lspconfig  BufReadPre BufNewFile   neoconf.nvim
    ○ nvim-navic 
    ○ nvim-spectre   Spectre   <leader>sr
    ○ nvim-ts-context-commentstring 
    ○ nvim-web-devicons 
    ○ persistence.nvim  BufReadPre   <leader>qs <leader>ql <leader>qd
    ○ plenary.nvim 
    ○ telescope.nvim   Telescope   <leader>, <leader>/ <leader>: <leader><space> <leader>fb <leader>ff <leader>fF <leader>fr <leader>fR <leader>gc <leader>gs <leader>s" <leader>sa <leader>sb <leader>sc <leader>sC <leader>sd <leader>sD <leader>sg <leader>sG <leader>sh <leader>sH <leader>sk <leader>sM <leader>sm <leader>so <leader>sR <leader>sw <leader>sW <leader>sw <leader>sW <leader>uC <leader>ss <leader>sS
    ○ todo-comments.nvim   TodoTrouble TodoTelescope  BufReadPost BufNewFile   ]t [t <leader>xt <leader>xT <leader>st <leader>sT
    ○ trouble.nvim   TroubleToggle Trouble   <leader>xx <leader>xX <leader>xL <leader>xQ [q ]q
    ○ vim-illuminate  BufReadPost BufNewFile   ]] [[
    ○ vim-startuptime   StartupTime

## coc-showdocuments

| 快捷键      | 动作             |
| ----------- | ---------------- |
| `<PageUp>`  | 帮助文档中上翻页 |
| `<PageDown` | 帮助文档中下翻页 |

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

- 转化 CSV 格式，将`value, value2, value3`转化成`| value | value2| value3 |`

- 转化其他格式，比如，将`value; value2; value3`转化成`| value | value2| value3 |`, 输入`:tableize/;`, `/`之后指定分隔符，此处为`;`

| 快捷键                 | 动作                |
| ---------------------- | ------------------- |
| `<leader>` `t` `m`     | 开启/关闭           |
| `<leader>` `t` `t`     | 转化 CSV 格式到表格 |
| `<leader>` `t` `d` `c` | 删除列              |
| `<leader>` `t` `d` `d` | 删除行              |
| `[` `<BAR>`            | 左移                |
| `]` `<BAR>`            | 左移                |
| `{` `<BAR>`            | 上移                |
| `}` `<BAR>`            | 下移                |

## makrdown-preview

| 快捷键             | 动作     |
| ------------------ | -------- |
| `<leader>` `m` `p` | 开启预览 |

## diff

在两个打开的文件中分别执行`diffthis`,则开启比较模式.

常用操作，分别在分屏的两侧打开两个文件，并在两个文件中执行`diffthis`，则开启竖屏比较模式.
