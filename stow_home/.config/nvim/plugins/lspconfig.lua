vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" } -- disables the warning: "(global) vim: unknown"
      }
    }
  },
}

vim.lsp.enable({
  'lua_ls' -- os package manager: `brew install lua-language-server`
})
