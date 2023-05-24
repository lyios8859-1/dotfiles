return {
  {
    lazy = false,
    priority = 1000,
    "folke/tokyonight.nvim",
    config = function()
      -- tokyonight-moon
      -- tokyonight-day
      -- tokyonight-night
      -- tokyonight-storm
      -- 设置主题
      vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
  -- {
  --   lazy = false,
  --   priority = 1000,
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   config = function()
  --     -- catppuccin-latte
  --     -- catppuccin-frappeD
  --     -- catppuccin-macchiato
  --     -- catppuccin-mocha
  --     -- 设置主题
  --     vim.cmd([[colorscheme catppuccin-mocha]])
  --   end
  -- },
  -- {
  --   lazy = false,
  --   priority = 1000,
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     -- 设置主题
  --     vim.cmd([[colorscheme gruvbox]])
  --   end
  -- }
}
