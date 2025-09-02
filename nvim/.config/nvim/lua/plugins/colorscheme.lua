return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local mauveHighlight = {
			fg = colors.mauve,
			bg = "NONE",
		}
		local textHighlight = {
			fg = colors.text,
			bg = "NONE",
		}

		require("catppuccin").setup({
			transparent_background = true,
			flavour = "mocha",
			custom_highlights = function()
				return {
					NormalFloat = mauveHighlight,
					FloatBorder = mauveHighlight,
					DiagnosticSignHint = mauveHighlight,
					DiagnosticSignInfo = mauveHighlight,
					DiagnosticSignOk = mauveHighlight,
					DiagnosticInfo = mauveHighlight,
					DiagnosticHint = mauveHighlight,
					NotifyINFOTitle = mauveHighlight,
					NotifyINFOBorder = mauveHighlight,
					NotifyINFOIcon = mauveHighlight,


					FloatTitle = textHighlight,
					NoiceCmdLinePopupTitleCmdline = textHighlight,
				}
			end,
			compile = {
				enabled = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
