local function file_tips()
  -- 相关提示信息在左侧预留列显示图标
  vim.fn.sign_define({
    {
      name = 'DiagnosticSignError',
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = 'ErrorLine',
    },
    {
      name = 'DiagnosticSignWarn',
      text = '',
      texthl = 'DiagnosticSignWarn',
      linehl = 'WarningLine',
    },
    {
      name = 'DiagnosticSignInfo',
      text = '',
      texthl = 'DiagnosticSignInfo',
      linehl = 'InfoLine',
    },
    {
      name = 'DiagnosticSignHint',
      text = '',
      texthl = 'DiagnosticSignHint',
      linehl = 'HintLine',
    },
  })
end


return {
  -- {
  --   -- lazy = false,
  --   -- priority = 1000,
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   config = function()
  --     -- catppuccin-latte
  --     -- catppuccin-frappeD
  --     -- catppuccin-macchiato
  --     -- catppuccin-mocha
  --     -- 设置主题
  --     vim.cmd([[colorscheme catppuccin-mocha]])
  --     file_tips()
  --   end
  -- },
  -- {
  --   'sainnhe/everforest',
  --   config = function()
  --     vim.g.everforest_diagnostic_line_highlight = 1
  --     vim.cmd('colorscheme everforest')
  --     file_tips()
  --   end
  -- },
  -- {
  --   lazy = false,
  --   priority = 1000,
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     vim.opt.termguicolors = true
  --     -- 设置主题
  --     vim.cmd([[colorscheme gruvbox]])
  --     file_tips()
  --   end
  -- },
  {
    -- lazy = false,
    -- priority = 1000,
    "folke/tokyonight.nvim",
    config = function()
      -- tokyonight-moon
      -- tokyonight-day
      -- tokyonight-night
      -- tokyonight-storm
      -- 设置主题
      require("tokyonight").setup({
        lualine_bold = true,
      })
      vim.cmd([[colorscheme tokyonight-moon]])
      file_tips()
    end
  },
}
