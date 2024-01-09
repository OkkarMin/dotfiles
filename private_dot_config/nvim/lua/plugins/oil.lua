return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "-", "<cmd>Oil<cr>", desc = "Open parents directory in oil" } },
}
