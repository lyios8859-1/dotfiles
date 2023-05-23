return {
  -- lazy = true,
  event = "VeryLazy",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fr", ":Telescope oldfiles<CR>", desc = "Open Recent File" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep File" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Files From Buffers" },
    { "<leader>fh", ":Telescope help_tags<CR>", desc = "Telescope Help" },
    { "<leader>rs", ":Telescope resume<CR>", desc = "resume" }, -- 回到上一次操作
  },
  -- sudo pacman -S ripgrep
  'nvim-telescope/telescope.nvim', tag = '0.1.1', -- 文件检索
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    -- require('telescope').extensions.notify.notify({})
  end
}
