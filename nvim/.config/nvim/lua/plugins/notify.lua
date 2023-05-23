return {
  -- lazy = true,
  -- event = "VeryLazy",
  "rcarriga/nvim-notify",
  config = function()
    vim.opt.termguicolors = true

    require("notify").setup({
      background_colour = "#000000",
    })

    vim.notify = require("notify");
  end
}
