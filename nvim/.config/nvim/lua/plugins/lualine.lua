return {
  -- lazy = true,
  -- event = "VeryLazy",
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "folke/tokyonight.nvim", lazy = true }
  },
  opts = {
    -- 这里会自动调用 require("lualine").setup(opts) 与里面的配置合并
    options = {
      theme = "tokyonight",
    }
  },
  config = function()
    -- 这样就可以把在 config 中设置的配置和 opts 中设置的配置合并一起使用了
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        -- lualine_b = {'branch', 'diff', 'diagnostics'},
        -- lualine_b = {{ 'filename', path = 3 }},
        -- lualine_b = {{ 'filename', path = 3 }, 'branch', 'diff', 'diagnostics'},
        lualine_b = {{ 'filename', path = 3 }, 'branch', 'diagnostics'},
        -- lualine_c = {'filename'},
        lualine_c = {},
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}
