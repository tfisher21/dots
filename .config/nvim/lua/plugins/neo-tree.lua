return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          close_if_last_window = true,
          toggle = true,
          source = "filesystem",
          position = "left",
          reveal = true,
        })
      end,
    },
  },
}
