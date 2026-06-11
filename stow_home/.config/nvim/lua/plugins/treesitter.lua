vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter"} })
require('nvim-treesitter').install { 'rust', 'go', 'lua', 'ruby', 'vim' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "go", "lua", "ruby", "rust", "vim" },
  callback = function() vim.treesitter.start() end,
})
