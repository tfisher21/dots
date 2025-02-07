return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require("mini.ai").setup({})
    require("mini.bracketed").setup({})
    require("mini.comment").setup({})
    require("mini.pairs").setup({})
    require("mini.splitjoin").setup({})
    require("mini.statusline").setup({})
    -- TODO: More Mini modules?
  end
}
