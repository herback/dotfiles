return {
	-- Configure nvim-notify first
	{
		"rcarriga/nvim-notify",
		opts = {
			top_down = false,
			background_colour = "#1e222a", -- Match your theme's background
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			-- Set as default notify function
			vim.notify = require("notify")
		end,
	},

	-- Then configure noice.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- nvim-notify is already configured above
		},

		opts = {
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
		},
	},
}
