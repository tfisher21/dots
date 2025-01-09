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

			telescope.load_extension("live_grep_args")
		end,
		keys = {
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers(require("telescope.themes").get_ivy({}))
				end,
				desc = "Buffers",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files({})
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args(
						require("telescope.themes").get_ivy({})
					)
				end,
				desc = "Live Grep Args",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
			},
		},
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
