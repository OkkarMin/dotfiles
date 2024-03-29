return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      window = {
        mappings = {
          ["Z"] = "expand_all_nodes",
          ["l"] = "open",
          ["h"] = "open",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    },
  },
}
