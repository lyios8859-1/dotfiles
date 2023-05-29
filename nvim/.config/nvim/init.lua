vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- utf8
vim.g.encoding = "UTF-8"
vim.o.termencoding = 'utf-8'
vim.scriptecoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

require("lazy-plugins")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.cmd")
    require("config.options")
    require("config.keymaps")
    -- vim.notify("TODO", vim.log.levels.INFO, {})
  end,
})
