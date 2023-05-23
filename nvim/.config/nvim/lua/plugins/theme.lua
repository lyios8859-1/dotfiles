return {
  lazy = false,
  -- event = "VeryLazy",
  priority = 1000,

  {
    "folke/tokyonight.nvim",
    config = function()
      -- tokyonight-moon
      -- tokyonight-day
      -- tokyonight-night
      -- tokyonight-storm
      -- 设置主题
      -- vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()

    -- catppuccin-latte
    -- catppuccin-frappe
    -- catppuccin-macchiato
    -- catppuccin-mocha
    vim.cmd([[colorscheme catppuccin-mocha]])
    end
  }
}
