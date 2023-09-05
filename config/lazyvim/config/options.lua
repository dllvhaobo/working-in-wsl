-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always vim.opt: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here



--将Leader键映射为'空格键'
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- 显示行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 光标
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- 命令补全
vim.opt.wildmenu = true
-- 显示指令
vim.opt.showcmd = true


vim.opt.mouse = 'nv'
vim.opt.encoding = 'utf-8'
vim.opt.fileformats = 'unix,dos'

--关闭vi兼容模式，以支持更多vim特性
-- vim.opt.nocompatible


vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--依据缩进进行折叠
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99


vim.opt.clipboard = "unnamedplus"

vim.opt.autochdir = false
