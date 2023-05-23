return {
  -- lazy = true,
  event = "VeryLazy",

  "nvim-treesitter/nvim-treesitter",
  opts = {
    --添加不同语言
    ensure_installed = {
      "lua",
      "vim",
      "json",
      "rust"
    },
    highlight = { enable = true },
    indent = { enable = true },
    -- 不同括号颜色区分
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
  }
}
