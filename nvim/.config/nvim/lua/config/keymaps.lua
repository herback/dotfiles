local function setup_keymaps()
  vim.keymap.set("n", "gl", function () vim.diagnostic.open_float() end, {desc = "Open Diagnostics in Float"})
	-- Neo-tree
	vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
	vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus NeoTree" })

	-- format code
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format code" })
end
setup_keymaps()
