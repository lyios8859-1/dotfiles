return {
  event = "VeryLazy",

  "folke/noice.nvim",
  dependencies = {
    event = "VeryLazy",
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    vim.opt.termguicolors = true

    require("noice").setup()

    require("notify").setup({
      background_colour = "#000000",
      render = "minimal"
    })

    vim.notify = require("notify");
  end
}
