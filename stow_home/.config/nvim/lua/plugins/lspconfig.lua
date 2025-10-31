vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" } -- disables the warning: "(global) vim: unknown"
      },
    },
  },
}

vim.lsp.config['gopls'] = {
  settings = {
    golps = {
      analyses = { unusedparams = true, },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

vim.lsp.enable({
  'lua_ls', -- os package manager: `brew install lua-language-server`
  'gopls', -- os package manager: `go install golang.org/x/tools/gopls@latest`
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params(0)
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
	if r.edit then
	  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
	  vim.lsp.util.apply_workspace_edit(r.edit, enc)
	end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})
