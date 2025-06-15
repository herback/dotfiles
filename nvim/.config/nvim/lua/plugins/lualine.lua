return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin/nvim" },
    opts = function()
      -- Get Catppuccin palette and options
      local cp = require("catppuccin.palettes").get_palette("mocha")
      local transparent_background = require("catppuccin").options.transparent_background

      return {
        options = {
          theme = {
            normal = {
              a = { bg = cp.blue, fg = cp.mantle, gui = "bold" },
              b = { bg = cp.surface0, fg = cp.blue },
              c = { bg = transparent_background and "NONE" or cp.mantle, fg = cp.text }
            },
            insert = {
              a = { bg = cp.mauve, fg = cp.base, gui = "bold" },
              b = { bg = cp.surface0, fg = cp.mauve }
            },
            visual = {
              a = { bg = cp.green, fg = cp.base, gui = "bold" },
              b = { bg = cp.surface0, fg = cp.green }
            },
            replace = {
              a = { bg = cp.red, fg = cp.base, gui = "bold" },
              b = { bg = cp.surface0, fg = cp.red }
            },
            inactive = {
              a = { bg = cp.mantle, fg = cp.blue },
              c = { bg = cp.mantle, fg = cp.overlay0 }
            }
          },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = { "alpha", "dashboard" } -- Optional exclusions
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } }, -- Show relative path
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        }
      }
    end
  }
}
