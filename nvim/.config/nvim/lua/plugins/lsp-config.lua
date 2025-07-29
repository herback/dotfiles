return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
			ensure_installed = {
				"ts_ls",
				"eslint",
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
		dependencies = {
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.diagnostic.config({
				virtual_text = true,
			})
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.java_language_server.setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
			},
			auto_update = true,
		},
	},
}
