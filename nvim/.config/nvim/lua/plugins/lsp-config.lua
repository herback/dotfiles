return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-lspconfig",
		config = function()
			vim.diagnostic.config({
				virtual_text = true,
			})
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.java_language_server.setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
			},
			auto_update = true,
		},
	},
}
