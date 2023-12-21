return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("harpoon")
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Add this to harpoon list",
      },
      {
        "<leader>hm",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Display harpoon list",
      },
      {
        "<leader>hl",
        "<cmd>Telescope harpoon marks<cr>",
        desc = "Display harpoon list",
      },
    },
  },
}
