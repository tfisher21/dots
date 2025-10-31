return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Gitsigns blame" }
  },
  opts = { current_line_blame = true },
}
