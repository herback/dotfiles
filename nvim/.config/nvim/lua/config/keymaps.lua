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
end

setup_keymaps()
