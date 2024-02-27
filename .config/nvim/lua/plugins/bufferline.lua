return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
      },
    })

    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { silent = true })
  end,
}
