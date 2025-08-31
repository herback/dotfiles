return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = { enabled = true },
		picker = {
			enabled = true,
			ui_select = true,
			layouts = {
				select = {
					layout = {
						relative = "cursor",
						width = 70,
						min_width = 0,
						row = 1,
					},
				},
			},
		},
		styles = {
			input = {
				relative = "cursor",
				width = 40,
				row = 1,
				col = 0,
				border = "rounded",
				title_pos = "left",
				wo = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle",
					cursorline = false,
				},
			},
		},
	},
}
