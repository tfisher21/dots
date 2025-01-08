return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.gopls.setup{}
      lspconfig.lua_ls.setup {}
      lspconfig.ruby_lsp.setup({
        cmd = { "/Users/tylerfisher/.asdf/shims/ruby-lsp" },
      })
      lspconfig.rubocop.setup({
        autostart = false,
      })
    end
  }
}
