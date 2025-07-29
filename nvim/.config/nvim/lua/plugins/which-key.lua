return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
win = {
      no_overlap = true,
      border = "rounded",
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
