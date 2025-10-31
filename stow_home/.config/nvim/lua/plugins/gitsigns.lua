vim.pack.add({
  "https://www.github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({ current_line_blame = true })

vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "Gitsigns blame" })
