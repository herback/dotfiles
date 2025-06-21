local function setup_keymaps()
	-- Neo-tree
	vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
	vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus NeoTree" })

	-- Telescope
	vim.keymap.set("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, { desc = "Find Files" })

	vim.keymap.set("n", "<leader>fg", function()
		require("telescope.builtin").live_grep()
	end, { desc = "Live Grep" })

	-- Lsp-config
	-- show description
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({
			border = "rounded",
			max_width = 80,
		})
	end)
	-- go to definition
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	-- show references
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	-- show actions
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	-- format code
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end
setup_keymaps()
