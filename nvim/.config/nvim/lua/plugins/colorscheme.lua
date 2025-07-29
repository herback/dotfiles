return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			custom_highlights = function(colors)
				return {
					NormalFloat = {
						fg = colors.mauve,
					},
					FloatBorder = { fg = colors.mauve },
				}
			end,
			compile = {
				enabled = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
