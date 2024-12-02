return {
	"frankroeder/parrot.nvim",
	dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
	-- optionally include "rcarriga/nvim-notify" for beautiful notifications
	config = function()
		require("parrot").setup({
			-- The provider definitions include endpoints, API keys, default parameters,
			-- and topic model arguments for chat summarization, with an example provided for Anthropic.
			providers = {
				anthropic = {
					api_key = os.getenv("ANTHROPIC_API_KEY"),
				},
			},
			toggle_target = "popup",
			user_input_ui = "buffer",
			hooks = {
				Ask = function(parrot, params)
					local template = [[
          In light of your existing knowledge base, please generate a response that
          is succinct and directly addresses the question posed. Prioritize accuracy
          and relevance in your answer, drawing upon the most recent information
          available to you. Aim to deliver your response in a concise manner,
          focusing on the essence of the inquiry.
          Question: {{command}}
        ]]
					local model_obj = parrot.get_model("command")
					parrot.logger.info("Asking model: " .. model_obj.name)
					parrot.Prompt(params, parrot.ui.Target.popup, model_obj, "🤖 Ask ~ ", template)
				end,
			},
		})
	end,
	keys = {
		{ "<leader>pa", "<cmd>PrtAsk<CR>" },
		{ "<leader>prw", "<cmd>PrtRewrite<CR>" },
	},
}
