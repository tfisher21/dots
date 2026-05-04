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

vim.lsp.config['ruby_lsp'] = {
  cmd = { "/Users/tylerfisher/.asdf/shims/ruby-lsp" },
  -- cmd = { "/Users/tylerfisher/.asdf/shims/ruby-lsp", "--branch", "main" } -- This line allows us to set a version for ruby-lsp
  filetypes = { 'ruby', 'eruby' },
  root_markers = { 'Gemfile' },
}

vim.lsp.enable({
  'lua_ls', -- os package manager: `brew install lua-language-server`
  'gopls', -- os package manager: `go install golang.org/x/tools/gopls@latest`
  'ruby_lsp', -- os package manager: gem install ruby-lsp (includes rubocop integration)
  'ts_ls', -- os package manager: npm install -g typscript-language-server typescript
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    -- Workaround for neovim 0.12-dev bug: ns_push and ns_pull resolve to the same
    -- namespace ID, causing code_action to send duplicate diagnostics -> actions listed twice.
    vim.keymap.set("n", "gra", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
      local client = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/codeAction" })[1]
      if not client then return end
      local ns = vim.lsp.diagnostic.get_namespace(client.id, true)
      local diags = vim.diagnostic.get(bufnr, { namespace = ns, lnum = lnum })
      vim.lsp.buf.code_action({
        context = {
          diagnostics = vim.tbl_map(function(d) return d.user_data.lsp end, diags),
        },
      })
    end, { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
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
