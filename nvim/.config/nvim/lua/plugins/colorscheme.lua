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
						bg = colors.mantle,
						fg = colors.mauve,
					},
					FloatBorder = { fg = colors.mauve },
					Pmenu = { bg = colors.mantle },
					PmenuSel = { bg = colors.surface0 },
				}
			end,
			compile = {
				enabled = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
