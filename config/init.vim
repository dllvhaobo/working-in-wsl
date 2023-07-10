"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vim/vimrc
"
" MISC
"
let mapleader=" "        " 将Leader键映射为'空格键'
set number               " 显示行号
set relativenumber       " 显示从当前行数的前后行数

set cursorline           " 高亮当前行
set cursorcolumn         " 高亮当前列

set wildmenu             " 命令补全
set showcmd              " 显示指令

set nocompatible         " 关闭vi兼容模式，以支持更多vim特性
set encoding=utf-8       " 文件编码
set fileformats=unix,dos " 文件格式，影响行结尾(unix:0x0a,windos;0x0a0d,mac:0x0d)

set mouse=a            " 支持鼠标

" 使用TreeSitter的折叠
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" set nofoldenable                     " Disable folding at startup.

" 不使用TreeSitter的折叠
set foldmethod=indent    " 依据缩进进行折叠
set foldlevel=99

set scrolloff=10

set laststatus=2        " 在所有窗口上开启Status-line

set ignorecase          " 忽略大小写
set smartcase           " 只能匹配大小写
set hlsearch            " 高亮现实搜索结果
set incsearch           " 动态高亮搜索
exec "nohlsearch"

" 清除当前高亮的结果
noremap <LEADER><CR> :nohlsearch<CR>


" Open vim config
noremap <LEADER>rc :e $MYVIMRC<CR>
noremap <LEADER>rcs :source $MYVIMRC<CR>
noremap <LEADER>key :e ~/works/system_config/docs/neovim.md<CR>

" Tab Expend and Size
set smarttab
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" 自动跳转到打开的文件所在目录
set noautochdir
" 使用系统剪贴板
set clipboard+=unnamedplus
" set backspace=indent,eol,start    " 退格跳过缩进，行结尾，开始

" 检查文件类型
" filetype on                       " 侦测文件类型
" filetype indent on                " 侦测文件类型
" filetype plugin on                " 侦测文件类型
filetype plugin indent on           " 侦测文件类型

" 跳转到文件上次打开的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE


" 使用剪贴板内容替换当前选中内容，并重新复制
" vnoremap p pgvy

" 比较模式设置
set diffopt=internal,filler,vertical
hi DiffChange    guibg=white guifg=blue
hi DiffText      guibg=white guifg=lightRed
hi DiffAdd       guibg=black guifg=lightyellow
hi DiffDelete    guibg=white guifg=blue
nmap <leader>dh :diffthis<CR>

map s <nop>
" 保存文件
nnoremap S :w<CR>
" 关闭当前文件
map Q :q<CR>

" 下翻5行
noremap <silent> <C-j> 5j

" 上翻5行
noremap <silent> <C-k> 5k

" 分屏
" 向右分屏
map sl :set splitright<CR>:vsplit<CR>
" 向左分屏
map sh :set nosplitright<CR>:vsplit<CR>
" 向下分屏
map sk :set nosplitbelow<CR>:split<CR>
" 向上分屏
map sj :set splitbelow<CR>:split<CR>

" 分屏切换
noremap <LEADER>w  <C-w>w
noremap <LEADER>wl <C-w>l
noremap <LEADER>wh <C-w>h
noremap <LEADER>wj <C-w>j
noremap <LEADER>wk <C-w>k

" 调整分屏大小
map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize -5<CR>
map <C-right> :vertical resize +5<CR>

" 新建标签页
map tn :tabe<CR>
" 切换到右侧标签页
map tl :+tabnext<CR>
" 切换到左侧标签页
map th :-tabnext<CR>

" Buffers
" 前一个打开的文件
map <Leader>bk :bp<CR>
" 后一个打开的文件
map <Leader>bj :bn<CR>

" Omni Completion
set omnifunc=syntaxcomplete#Complete
autocmd FileType yaml set omnifunc=yamlcomplete#CompleteYAML

set noswapfile              " 禁用缓冲文件, 禁用.swap文件

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug: Install Begin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" im-sleect: 输入法自动切换
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'zhaosheng-pan/vim-im-select'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline: VIM底部状态条
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Surround Add/delete/replace
" type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-peekaboo: 显示VIM寄存器内容
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/vim-peekaboo'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion: 全屏快速跳转
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vista: 侧边符号栏
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'liuchengxu/vista.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replaced with vista
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'majutsushi/tagbar'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tree-sitter 代码高亮
" tree-sitter代码高亮与vista冲突，安装tree-sitter会导致vista关闭后，buffer区不刷新
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown: 表格对齐
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown: 在浏览器中打开预览
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
"
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown: Table of Content
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mzlogin/vim-markdown-toc'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Yggdroot/LeaderF-marks'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-signify:
" 结合GIT，SVN等，在侧边栏标记增加，改动，删除等。与vim-gitgutter类似
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-signify'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" commenter: 注释工具
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo Tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'mbbill/undotree'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plantuml
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 多光标操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mg979/vim-visual-multi', {'branch': 'master'}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'honza/vim-snispets'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient: LSP support
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'autozimu/LanguageClient-neovim', {  'branch': 'next',  'do': 'bash install.sh'  }

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
" Defx: 侧边栏文件浏览器(replaced with coc-explorer)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Doxygen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'vim-scripts/DoxygenToolkit.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox配色
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'morhetz/gruvbox'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify: vim启动时，显示最近打开的文件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'mhinz/vim-startify'

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

" 搜索结果折叠
" Plug 'embear/vim-foldsearch'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug: Install End
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree: 未启用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map tt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = ""
" let NERDTreeMapUpdirKeepOpen = "h"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeOpenVSplit = "S"
" let NERDTreeMapActivateNode = "l"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = "n"
" let NERDTreeMapChangeRoot = "y"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree-Git: 未启用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ "Unknown"   : "?"
"     \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.project']
let g:python3_host_prog = '/usr/bin/python3'
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 1
let g:Lf_StlColorscheme = 'powerline'
" let g:Lf_UseVersionControlTool = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_ShowDevIcons = 1
let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_DevIconsFont = "DejaVu Sans Mono for Powerline"
let g:Lf_DevIconsFont = "Droid Sans Mono"
let g:Lf_WildIgnore = {
            \ 'file': ['*.json' ,'*.html','*.json','*test*','*.txt']
            \ }
" let g:Lf_WildIgnore = {
            " \ 'dir': ['Build','build', '.cache', 'tools'],
            " \ 'file': ['*.json' ]
            " \}
" popup mode
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PopupHeight = 0.7
" let g:Lf_PopupWeigth= 0.8
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 1, 'Files':1, 'Tags': 1, }
let g:Lf_PreviewCode=1
let g:Lf_RecurseSubmodules = 1  " 递归查找git submodule

let g:Lf_ShortcutF ='<C-P>'
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>mr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fa :LeaderfFunction<CR>
noremap <leader>fm :LeaderfMarks<CR>
" noremap <leader>bl :LeaderfBuffer<CR>
noremap <C-e> :LeaderfBuffer<CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg  -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg  --iglob !*.xml --iglob !*.html --iglob !*.json --iglob !*.js --iglob !*test* -e %s ", expand("<cword>"))<CR>
"" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
noremap <leader>gn :Leaderf! rg --next<CR>
noremap <leader>gp :Leaderf! rg --previous<CR>


let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'

" 需要首先执行`Leaderf gtags --update`生成gtags。
noremap <leader>fu :Leaderf gtags --update<CR>

" 列举工程目录下的符号
noremap <leader>fl :Leaderf gtags<CR>

" 查看当前符号的引用
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>

" 查看当前符号的定义
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>

" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall ")<CR><CR>

" 跳转至引用符号列表
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"
" 跳转至引用符号的下一条
noremap <leader>fn :<C-U><C-R>=printf("Leaderf! gtags --next %s", "")<CR><CR>

" 跳转至引用符号的上一条
noremap <leader>fp :<C-U><C-R>=printf("Leaderf! gtags --previous %s", "")<CR><CR>

" Command	Description
" <C-C>	quit from LeaderF
" <C-R>	switch between fuzzy search mode and regex mode
" <C-F>	switch between full path search mode and name only search mode
" <Tab>	switch to normal mode
" <C-V>	paste from clipboard
" <C-U>	clear the prompt
" <C-W>	delete the word before the cursor in the prompt
" <C-J>	move the cursor downward in the result window
" <C-K>	move the cursor upward in the result window
" <Up>/<Down>	recall last/next input pattern from history
" <C-X>	open in horizontal split window
" <C-]>	open in vertical split window
" <C-T>	open in new tabpage
" <C-\>	show a prompt enable to choose split window method: vertical, horizontal, tabpage, etc
" <F5>	refresh the cache
" <S-LeftMouse>	select consecutive multiple files
" <C-A>	select all files
" <C-L>	clear all selections
" <BS>	delete the preceding character in the prompt
" <Del>	delete the current character in the prompt
" <Home>	move the cursor to the begin of the prompt
" <End>	move the cursor to the end of the prompt
" <Left>	move the cursor one character to the left in the prompt
" <Right>	move the cursor one character to the right in the prompt
" <C-P>	preview the result
" <C-Up>	scroll up in the popup preview window
" <C-Down>	scroll down in the popup preview window


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder(fzf)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
"let g:fzf_preview_window = ['right:50%', 'ctrl-/']
"
"" Preview window on the upper side of the window with 40% height,
"" hidden by default, ctrl-/ to toggle
"let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
"
"" Empty value to disable preview window altogether
"let g:fzf_preview_window = []
"" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1
"
"" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
"" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'
"
"" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'
"
"" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"
"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-l> <plug>(fzf-complete-line)
""
" nmap <C-p> :Files<CR>
" nmap <C-e> :Buffers<CR>

"let g:fzf_action = { 'ctrl-e': 'edit' }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vista
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>T :Vista!!<CR>
" nmap <leader>fa :Vista finder<CR>

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

" set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
" let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width=120
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_update_on_text_changed = 1
let g:vista_close_on_jump = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" map <LEADER>cc <Plug>(NERDCommenterInvert)
" [count]<leader>cc |NERDCommenterComment|
" Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDCommenterNested|
" Same as cc but forces nesting.
" [count]<leader>c<space> |NERDCommenterToggle|
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDCommenterMinimal|
" Comments the given lines using only one set of multipart delimiters.
" [count]<leader>ci |NERDCommenterInvert|
" Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDCommenterSexy|
" Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDCommenterYank|
" Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDCommenterToEOL|
" Comments the current line from the cursor to the end of line.
" <leader>cA |NERDCommenterAppend|
" Adds comment delimiters to the end of line and goes into insert mode between them.
" |NERDCommenterInsert|
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
" <leader>ca |NERDCommenterAltDelims|
" Switches to the alternative set of delimiters.
" [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
" Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDCommenterUncomment|


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal Behaviors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defx: 配置 (Replaced with coc-explorer)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>e :Defx<CR>
" call defx#custom#option('_', {
"       \ 'winwidth': 30,
"       \ 'split': 'vertical',
"       \ 'direction': 'topleft',
"       \ 'show_ignored_files': 0,
"       \ 'buffer_name': '',
"       \ 'toggle': 1,
"       \ 'resume': 1
"       \ })

" autocmd FileType defx call s:defx_my_settings()
" function! s:defx_my_settings() abort
"   " " Define mappings
"   nnoremap <silent><buffer><expr> <CR> defx#do_action( 'open')
"   nnoremap <silent><buffer><expr> <CR> defx#do_action( 'drop')
"   nnoremap <silent><buffer><expr> c  defx#do_action('copy')
"   nnoremap <silent><buffer><expr> m  defx#do_action('move')
"   nnoremap <silent><buffer><expr> p  defx#do_action('paste')
"   nnoremap <silent><buffer><expr> l  defx#do_action('drop')
"   nnoremap <silent><buffer><expr> E  defx#do_action('drop', 'vsplit')
"   nnoremap <silent><buffer><expr> P  defx#do_action('preview')
"   nnoremap <silent><buffer><expr> o  defx#do_action('open_tree', 'toggle')
"   nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
"   nnoremap <silent><buffer><expr> N  defx#do_action('new_file')
"   nnoremap <silent><buffer><expr> M  defx#do_action('new_multiple_files')
"   nnoremap <silent><buffer><expr> C  defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
"   nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
"   nnoremap <silent><buffer><expr> d  defx#do_action('remove')
"   nnoremap <silent><buffer><expr> r  defx#do_action('rename')
"   nnoremap <silent><buffer><expr> !  defx#do_action('execute_command')
"   nnoremap <silent><buffer><expr> x  defx#do_action('execute_system')
"   nnoremap <silent><buffer><expr> yy  defx#do_action('yank_path')
"   nnoremap <silent><buffer><expr> .   defx#do_action('toggle_ignored_files')
"   nnoremap <silent><buffer><expr> ;  defx#do_action('repeat')
"   nnoremap <silent><buffer><expr> h  defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> ~  defx#do_action('cd')
"   nnoremap <silent><buffer><expr> q  defx#do_action('quit')
"   nnoremap <silent><buffer><expr> <Space>  defx#do_action('toggle_select') . 'j'
"   nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
"   nnoremap <silent><buffer><expr> j  line('.') == line('$') ? 'gg' : 'j'
"   nnoremap <silent><buffer><expr> k  line('.') == 1 ? 'G' : 'k'
"   nnoremap <silent><buffer><expr> <C-l>  defx#do_action('redraw')
"   nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
"   nnoremap <silent><buffer><expr> cd  defx#do_action('change_vim_cwd')
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap L :UndotreeToggle<CR>
" let g:undotree_DiffAutoOpen = 1
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_ShortIndicators = 1
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 8
" let g:undotree_SplitWidth = 24
" function g:Undotree_CustomMap()
"     nmap <buffer> u <plug>UndotreeNextState
"     nmap <buffer> e <plug>UndotreePreviousState
"     nmap <buffer> U 5<plug>UndotreeNextState
"     nmap <buffer> E 5<plug>UndotreePreviousState
" endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ysw : surround word add
" cs  : surround word repalce
" ds  : surround word delete
" yss : line head and tail
" ySS : line before and after
" v{motion}S: block head and tail
" v{motion}St: add tags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim visual multi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:signify_difftool = 'diff --strip-trailing-cr'
" let g:signify_difftool = 'nvim -d'

  " \ 'svn':      "svn cat %f",
let g:signify_vcs_cmds_diffmode = {
  \ 'git':      'git show HEAD:./%f',
  \ 'yadm':     'yadm show HEAD:./%f',
  \ 'hg':       'hg cat %f',
  \ 'svn':      "svn cat %f",
  \ 'bzr':      'bzr cat %f',
  \ 'darcs':    'darcs show contents -- %f',
  \ 'fossil':   'fossil cat %f',
  \ 'cvs':      'cvs up -p -- %f 2>%n',
  \ 'rcs':      'co -q -p %f',
  \ 'accurev':  'accurev cat %f',
  \ 'perforce': 'p4 print %f',
  \ 'tfs':      'tf view -version:W -noprompt %f',
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient-neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }
" let g:LanguageClient_serverCommands = {
    " \ 'python': ['/usr/local/bin/pyls'],
    " \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox配色 (disable)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-syntax',
  \ 'coc-prettier',
  \ 'coc-marketplace',
  \ 'coc-explorer',
  \ 'coc-diagnostic',
  \ 'coc-clang-format-style-options',
  \ 'coc-yaml',
  \ 'coc-vimlsp',
  \ 'coc-markdown-preview-enhanced',
  \ 'coc-pyright',
  \ 'coc-snippets',
  \ 'coc-webview']
  " \ 'coc-cmake']
  " \ 'coc-yank',
  " \ 'coc-jedi',
  " \ 'coc-git',
  " \ 'coc-tasks',
  " \ 'coc-docker',
  "
set nobackup
set nowritebackup
set hidden
set updatetime =300
set shortmess+=c
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=1


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"
"  Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn :CocNext<CR>
nmap <silent> gp :CocPrev<CR>

" Use 'h' to show documentation in preview window.
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"
" Hover Documents scroll
nnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <PageDown> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <PageUp> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

"
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"
" Coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>

" Check Reigster
" nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"
" Markdown Preview enhanced
nmap <space>cmp <Cmd>CocCommand markdown-preview-enhanced.openPreview<CR>
" Markdown Create Toc
nmap <space>cmt <Cmd>CocCommand markdown-preview-enhanced.createTOC<CR>
" 通过命令查看MarkdownPreview支持的命令
" :CocList --input=markdown-preview-enhanced. commands

"
" coc-format-selected
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
map <silent> <leader>ff :call CocAction('format')<CR>

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-snippets start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
let g:snips_author = 'Lv_hb'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
imap <C-e> <Plug>(coc-snippets-expand-jump)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-snippets end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" grep word under cursor
" command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

" function! s:GrepArgs(...)
"   let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
"         \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
"   return join(list, "\n")
" endfunction


" Keymapping for grep word under cursor with interactive mode
" nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
" nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

" function! s:GrepFromSelected(type)
"   let saved_unnamed_register = @@
"   if a:type ==# 'v'
"     normal! `<v`>y
"   elseif a:type ==# 'char'
"     normal! `[v`]y
"   else
"     return
"   endif
"   let word = substitute(@@, '\n$', '', 'g')
"   let word = escape(word, '| ')
"   let @@ = saved_unnamed_register
"   execute 'CocList grep '.word
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" table-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" | 快捷键                 | 动作              |
" |------------------------|-------------------|
" | `<leader>` `t` `m`     | 开启/关闭         |
" | `<leader>` `t` `t`     | 转化CSV格式到表格 |
" | `<leader>` `t` `d` `c` | 删除列            |
" | `<leader>` `t` `d` `d` | 删除行            |
" | `[` `<BAR>`            | 左移              |
" | `]` `<BAR>`            | 左移              |
" | `{` `<BAR>`            | 上移              |
" | `}` `<BAR>`            | 下移              |
nmap <leader>tm :TableModeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mkdp_open_to_the_world = 1
nmap <leader>mp <Plug>MarkdownPreview
" nmap <leader>mp <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plantuml-preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:plantuml_previewer#plantuml_jar_path='/usr/share/plantuml/plantuml.jar'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Date
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>day i<C-R>=strftime("[%Y-%m-%d]")<CR><ESC>
nmap <leader>time i<C-R>=strftime("[%T]")<CR><ESC>
nmap <leader>date i<C-R>=strftime("[%Y-%m-%d %T]")<CR><ESC>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MergeTool
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'

nmap <leader>mt <plug>(MergetoolToggle)

" lua require('plugin-config/treesitter')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_left_sep='>'
