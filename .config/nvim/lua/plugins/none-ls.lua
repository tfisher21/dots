return {
  "nvimtools/none-ls.nvim",
  config = function()
    local none_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    none_ls.setup({
      sources = {
        none_ls.builtins.formatting.stylua,
        -- none_ls.builtins.diagnostics.rubocop, -- Doesn't work in current Molecule environment due to version of rubocop used
        none_ls.builtins.formatting.rubocop,
        none_ls.builtins.diagnostics.eslint_d,
        none_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "css", "scss", "json", "yaml", "markdown" },
        }),
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
