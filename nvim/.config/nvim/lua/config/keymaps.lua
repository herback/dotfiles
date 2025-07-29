local function setup_keymaps()
	-- Neo-tree
	vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
	vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus NeoTree" })

	-- Lsp-config
	-- show description
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({
			max_width = 80,
		})
	end, { desc = "Show documentation" })
	-- go to definition
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
	-- show references
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
	-- show actions
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Display Code actions" })
	-- format code
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
end
setup_keymaps()
