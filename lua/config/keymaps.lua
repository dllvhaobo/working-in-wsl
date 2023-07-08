-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
--
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Plit windows
map("n", "sh", ":set nosplitright<kR>:vsplit<CR>", { desc = "split window on left", remap = true })
map("n", "sj", ":set splitbelow<CR>:split<CR>", { desc = "split window on below", remap = true })
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", { desc = "split window on above", remap = true })
map("n", "sl", ":set splitright<CR>:vsplit<CR>", { desc = "split window on right", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase window width" })


-- Quit
map("n", "Q", ":q<cr>", { desc = "Quit" })

-- save
map("n", "S", ":w<cr>", { desc = "Save" })


map({"n",'x'}, "<C-J>", "5j", { desc = "move down 5" })
map({"n",'x'}, "<C-K>", "5k", { desc = "move up 5" })




