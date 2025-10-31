vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<leader>yn", '<cmd>let @+ = expand("%:t")', { desc = "Copy file name", silent = true })
vim.keymap.set("n", "<leader>yr", '<cmd>let @+ = expand("%:.")', { desc = "Copy relative path", silent = true })
vim.keymap.set("n", "<leader>ya", '<cmd>let @+ = expand("%:p")', { desc = "Copy absolute path", silent = true })

vim.keymap.set("n", "<leader>qo", "<cmd>:cope<cr>", { desc = "Open Quickfix Menu", silent = true })
vim.keymap.set("n", "<leader>qc", "<cmd>:ccl<cr>", { desc = "Close Quickfix Menu", silent = true })

-- Neovim Plugin Management
vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name="catppuccin" },
  "https://github.com/neovim/nvim-lspconfig",
})

-- Colorscheme Install
require("catppuccin").setup({})

vim.cmd.colorscheme "catppuccin"

vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = {
      diagnostics = {
	globals = { "vim" } -- disables the warning: "(global) vim: unknown"
      }
    }
  },
}

-- Neovim LSP
vim.lsp.enable({
  'lua_ls' -- brew install lua-language-server
})
