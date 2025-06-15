return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
       -- "java_language_server",
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    }
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
    end
  }
}
