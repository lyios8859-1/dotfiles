-- 设置一个上档键(引导键), 这里设置为空格，也可以是其他键
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- 在命令行模式下输入：Lazy 调出面板
require("lazy-plugins")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- TODO
  end,
})

--
-- 各种语言的配置说明
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack
--
