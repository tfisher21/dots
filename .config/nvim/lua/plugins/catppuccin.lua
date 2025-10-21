return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd [[colorscheme catppuccin]]
    require("catppuccin").setup{
      auto_integrations = true,
    }
  end
}
