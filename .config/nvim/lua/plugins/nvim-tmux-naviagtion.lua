return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    -- local nvim_tmux_nav = require("nvim-tmux-navigation")

    -- nvim_tmux_nav.setup({
    --   disable_when_zoomed = true, -- defaults to false
    -- })

    -- vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { noremap = true, silent = true })
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      },
    })
  end,
}
