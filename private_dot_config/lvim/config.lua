--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "onedark"
-- lvim.builtin.lualine.style = "lvim" -- or "none"

-- code folding configuration
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
local wk = lvim.builtin.which_key
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>rn"] = "<cmd>lua vim.lsp.buf.rename()<CR>"
lvim.keys.insert_mode["jj"] = "<Esc>"

wk.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  "Search Word Under Cursor"
}

wk.mappings["W"] = {
  name = "Window Control",
  ['|'] = { '<C-w>v', 'Split window vertically (|)' },
  ['_'] = { '<C-w>s', 'Split window horizontally (_)' },
  h = { '<C-w>|', 'Maximize window horizontally (|)' },
  v = { '<C-w>_', 'Maximize window vertically (_)' },
  ['='] = { '<C-w>=', 'Resize windows equally' },
  c = { '<C-w>q', 'Close window' },
  s = { ":lua require('telescope-tabs').list_tabs()<cr>", 'Search Tabs' },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- User plugins
lvim.plugins = {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        code_style = {
          comments = "italic",
          keywords = "italic",
          functions = "italic",
          variables = "italic",
        }
      })
      require("onedark").load()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false
        }
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      local hop = require("hop")
      vim.keymap.set('', 'f', function()
        hop.hint_char1()
      end, { remap = true })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  { "ThePrimeagen/harpoon" },
  { "christoomey/vim-tmux-navigator" },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "prettier/vim-prettier",
  }
}

require("onedark").load()

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- GoTo Definition and GoTo References
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  " Find references"
}
lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  -- ":lua vim.lsp.buf.definition()<cr>",
  ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  " Definitions"
}
lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  " Type Definition"
}
lvim.lsp.buffer_mappings.normal_mode["gf"] = {
  ":Telescope frecency<cr>",
  " Telescope Frecency"
}

-- Harpoon configuration
wk.mappings["m"] = {
  name = " Harpoon",
  m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
  t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
  n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
  p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

vim.api.nvim_set_hl(0, 'Comment', { italic = true })

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "black", filetypes = { "python" } },
  -- { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
