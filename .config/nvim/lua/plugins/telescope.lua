return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
		},
		config = function()
			local telescope = require("telescope")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				extensions = {
					live_grep_args = {
						auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
							},
						},
					},
				},
			})

			require("telescope").load_extension("live_grep_args")
		end,
		keys = {
			{
				"<leader>ff",
				"<cmd>lua require('telescope.builtin').find_files()<cr>",
				desc = "Find Files",
			},
			{
				"<leader>fg",
				"<cmd>lua require('telescope.builtin').live_grep()<cr>",
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				"<cmd>lua require('telescope.builtin').buffers()<cr>",
				desc = "Buffers",
			},
			{
				"<leader>fr",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				desc = "Live Grep Args",
			},
			{
				"<leader>gc",
				"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>",
				desc = "Live Grep Word Under Cursor",
			},
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
