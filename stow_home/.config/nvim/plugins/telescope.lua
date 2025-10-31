vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
  pickers = {
    help_tags = { theme = 'ivy' },
      buffers = { theme = 'ivy' },
    },
    extensions = {
      fzf = {}
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<space>en", function()
  builtin.find_files { cwd = vim.fn.stdpath("config") }
end)
vim.keymap.set("n", "<space>fb", builtin.buffers)
vim.keymap.set("n", "<space>ff", builtin.find_files)
vim.keymap.set("n", "<space>fF", function()
  require('telescope.builtin').find_files { hidden = true }
end)
vim.keymap.set("n", "<space>fg", function()
  require("config.telescope.multigrep").setup()
end)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<leader><tab>", builtin.commands)
