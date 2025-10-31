vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<leader>yn", '<cmd>let @+ = expand("%:t")<cr>', { desc = "Copy file name", silent = true })
vim.keymap.set("n", "<leader>yr", '<cmd>let @+ = expand("%:.")<cr>', { desc = "Copy relative path", silent = true })
vim.keymap.set("n", "<leader>ya", '<cmd>let @+ = expand("%:p")<cr>', { desc = "Copy absolute path", silent = true })

vim.keymap.set("n", "<leader>qo", "<cmd>:cope<cr>", { desc = "Open Quickfix Menu", silent = true })
vim.keymap.set("n", "<leader>qc", "<cmd>:ccl<cr>", { desc = "Close Quickfix Menu", silent = true })

require("plugins.blink")
require("plugins.catppuccin")
require("plugins.gitsigns")
require("plugins.lspconfig")
require("plugins.mini")
require("plugins.oil")
require("plugins.telescope")
require("plugins.treesitter")
