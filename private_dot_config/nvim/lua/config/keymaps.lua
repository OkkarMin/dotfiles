-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("x", "p", "P", { desc = "Paste without yanking the deleted text" })

-- move up and down text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- ctrl u/d is not disorienting
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- save file in buffer using <leader>bs and <leader>bS for saving all buffers
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save current buffer" })
map("n", "<leader>bS", "<cmd>wa<cr>", { desc = "Save all buffer" })

-- use jj to exit insert mode
map("i", "jj", "<ESC>", { silent = true })

-- create window using - and \
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<cmd>lua require'tmux'.move_left()<cr>", { desc = "Go to left window" })
map("n", "<C-j>", "<cmd>lua require'tmux'.move_bottom()<cr>", { desc = "Go to lower window" })
map("n", "<C-k>", "<cmd>lua require'tmux'.move_top()<cr>", { desc = "Go to upper window" })
map("n", "<C-l>", "<cmd>lua require'tmux'.move_right()<cr>", { desc = "Go to right window" })
