vim.pack.add({
  "https://github.com/saghen/blink.cmp",
})

-- When blink.cmp is updated, we need to run `cargo build --release` in the following directory:
-- ~/.local/share/nvim/site/pack/core/opt/blink.cmp/

require('blink.cmp').setup({
  keymap = {
    preset = 'default', -- or 'super-tab', 'enter'
  },
  appearance = {
    use_nvim_cmp_as_default = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
