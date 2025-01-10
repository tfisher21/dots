return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup({
        pickers = {
          help_tags = { theme = 'ivy' },
          buffers = { theme = 'ivy' },
        },
        extensions = {
          fzf = {}
        },
      })

      local builtin = require('telescope.builtin')

      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>fb", builtin.buffers)
      vim.keymap.set("n", "<space>ff", builtin.find_files)
      vim.keymap.set("n", "<space>fF", function()
        require('telescope.builtin').find_files { hidden = true }
      end)
      vim.keymap.set("n", "<space>fg", function()
        require("config.telescope.multigrep").setup()
      end)
      vim.keymap.set("n", "<space>fh", builtin.help_tags)
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_ivy({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
