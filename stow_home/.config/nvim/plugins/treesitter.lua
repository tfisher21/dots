vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "lua", "rust", "vim" },
  sync_install = true,
  auto_install = false,
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
})
