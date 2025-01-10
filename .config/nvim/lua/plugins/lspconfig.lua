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
        -- cmd = { "/Users/tylerfisher/.asdf/shims/ruby-lsp", "--branch", "main" } -- This line allows us to set a version for ruby-lsp
      })
      lspconfig.rubocop.setup({
        autostart = false,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(eval)
          local opts = { buffer = eval.buf }

          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end)
        end
      })
    end
  }
}
