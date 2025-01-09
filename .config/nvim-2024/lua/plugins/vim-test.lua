return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test File" },
		{ "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
		{ "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test Suite" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test Last" },
		{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test Visit" },
	},
	config = function()
		vim.g["test#strategy"] = "vimux"
	end,
}
