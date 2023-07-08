-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local  set = vim.opt

-- 行号
set.number = true
set.relativenumber = true

-- 光标
set.cursorline = true
set.cursorcolumn = true

-- 命令补全
set.wildmenu = true
-- 显示指令
set.showcmd = true


set.mouse = 'nv'
set.encoding = 'utf-8'
set.fileformats = 'unix,dos'

--关闭vi兼容模式，以支持更多vim特性
-- set.nocompatible


set.foldmethod = 'expr'
set.foldexpr = "nvim_treesitter#foldexpr()"
--依据缩进进行折叠
set.foldmethod = "indent"
set.foldlevel = 99

--let mapleader=" "        " 将Leader键映射为'空格键'

set.clipboard = "unnamedplus"
