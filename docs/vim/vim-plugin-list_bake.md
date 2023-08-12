# Neovim 配置说明

## 必选插件

| 应用说明                 | 插件名称                      | Adopted |
| ------------------------ | ----------------------------- | :-----: |
| 输入法自动切换           | 'zhaosheng-pan/vim-im-select' |   YES   |
| VIM Surround             | 'tpope/vim-surround'          |   YES   |
| airline                  | 'vim-airline/vim-airline'     |   YES   |
| 先寄存器内容             | 'junegunn/vim-peekaboo'       |   YES   |
| EasyMotion               | 'easymotion/vim-easymotion'   |   YES   |
| LeaderF                  | 'Yggdroot/LeaderF'            |   YES   |
| LeaderF-Marks            | 'Yggdroot/LeaderF-marks'      |   YES   |
| FZF                      | 'junegunn/fzf'                |   YES   |
| FZF                      | 'junegunn/fzf.vim'            |   YES   |
| FZF                      | 'antoinemadec/coc-fzf'        |   YES   |
| 侧边栏                   | 'liuchengxu/vista.vim'        |   YES   |
| 侧边栏                   | 'majutsushi/tagbar'           |   NO    |
| 侧边栏                   | 'Shougo/defx.nvim'            |   NO    |
| 注释                     | 'preservim/nerdcommenter'     |   YES   |
| 对齐工具                 | 'junegunn/vim-easy-align'     |   YES   |
| Undo list                | 'mbbill/undotree'             |   NO    |
| 多光标操作               | 'mg979/vim-visual-multi'      |   YES   |
| 启动时显示最近打开的文件 | 'mhinz/vim-startify'          |   NO    |
| 代码高亮                 | 'tree-sitter'                 |   YES   |

## MarkDown

| 应用说明                     | 插件名称                                | Adopted |
| ---------------------------- | --------------------------------------- | :-----: |
| markdown Table 工具          | 'dhruvasagar/vim-table-mode'            |   YES   |
| Markdown Instance Preview    | 'instant-markdown/vim-instant-markdown' |   NO    |
| Markdown: 在浏览器中打开预览 | 'iamcco/markdown-preview.nvim'          |   YES   |
| Markdown Table of Content    | 'mzlogin/vim-markdown-toc'              |   YES   |

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tree-sitter
" tree-sitter 代码高亮与 vista 冲突，安装 tree-sitter 会导致 vista 关闭后，buffer 区不刷新
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" vim-signify:
" 结合 GIT，SVN 等，在侧边栏标记增加，改动，删除等。与 vim-gitgutter 类似
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-signify'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plantuml
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'honza/vim-snispets'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient: LSP support
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"
" Plug 'neoclide/coc-highlight'
" Plug 'jackguo380/vim-lsp-cxx-highlight'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimSpector 代码调试器
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'puremourning/vimspector'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TO Confirm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'ryanoasis/vim-devicons'
" Plug 'skanehira/docker-compose.vim'
" Plug 'neoclide/coc-highlight'
" Plug 'jackguo380/vim-lsp-cxx-highlight'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-polyglot:
" 语法高亮语言包，支持的语言包可以到https://github.com/sheerun/vim-polyglot查询
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'sheerun/vim-polyglot'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法检查？
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'vim-syntastic/syntastic'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'vim-scripts/indentpython.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown: Table of Content, replaced with coc-markdown-preview-enhanced
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'mzlogin/vim-markdown-toc'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox 配色
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'morhetz/gruvbox'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" devicons: 文件图标
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-tree/nvim-tree.lua'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deprecated
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'vimwiki/vimwiki'
" Plug 'sbdchd/neoformat'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'scrooloose/vim-slumlord'
" Plug 'vimwiki/vimwiki'
" Plug 'glidenote/memolist.vim'
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
" Plug 'bootleq/vim-gitdiffall'
" Plug 'samoshkin/vim-mergetool'
" Plug 'tell-k/vim-autopep8'

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
