-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- turn off relative line
opt.relativenumber = false

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- for theme to work --
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
