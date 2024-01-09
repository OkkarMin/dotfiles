return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {
    keymaps = {
      ["q"] = "actions.close",
      ["H"] = "actions.toggle_hidden",
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "-", "<cmd>Oil --float<cr>", desc = "Open parents directory in oil" } },
}
