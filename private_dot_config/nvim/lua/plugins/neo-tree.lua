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
        },
      },
    },
  },
}
