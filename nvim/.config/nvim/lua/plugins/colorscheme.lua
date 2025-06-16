return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = colors.mantle },
            FloatBorder = { fg = colors.mauve },
          }
        end
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}

