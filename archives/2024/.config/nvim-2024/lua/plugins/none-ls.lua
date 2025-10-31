return {
  "nvimtools/none-ls.nvim",
  config = function()
    local none_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    none_ls.setup({
      sources = {
        -- Lua Support
        none_ls.builtins.formatting.stylua,

        -- Ruby Support
        -- none_ls.builtins.diagnostics.rubocop,
        -- none_ls.builtins.formatting.rubocop,

        -- Golang Support
        none_ls.builtins.diagnostics.golangci_lint,
        none_ls.builtins.formatting.gofumpt,
        none_ls.builtins.formatting.goimports,
        none_ls.builtins.formatting.goimports_reviser,
        none_ls.builtins.formatting.golines,

        -- Javascript & Typescript Support
        none_ls.builtins.diagnostics.eslint,
        -- none_ls.builtins.diagnostics.eslint_d,
        none_ls.builtins.formatting.prettier,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
