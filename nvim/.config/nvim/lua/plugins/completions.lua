return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "1.*",

		opts = {
			keymap = { preset = "enter", ["<Tab>"] = { "accept", "fallback" } },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
					treesitter_highlighting = true,
					window = {
						border = "rounded",
					},
				},
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
		},

		opts_extend = { "sources.default" },
	},
}
