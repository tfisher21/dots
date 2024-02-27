return {
	"terrortylor/nvim-comment",
	config = function()
		require("nvim_comment").setup({
			marker_padding = true,
			comment_empty = false,
			create_mappings = true,
			line_mapping = "<leader>cc",
			operator_mapping = "<leader>c",
			hooks = {},
			mappings = {},
			ignore = {},
			padding = true,
		})
	end,
}
