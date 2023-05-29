return {
  -- lazy = true,
  event = "VeryLazy",
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    -- 还没配置好，还需要去注册对应的快捷键命令
    require("which-key").setup()
  end,
}
