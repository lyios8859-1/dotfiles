return {
  {
    event = "VeryLazy",
    'j-hui/fidget.nvim',
    config = function()
      require("fidget").setup()
    end
  },
  {
    event = "VeryLazy",
    'AndrewRadev/sideways.vim',
    config = function()
      -- 交换参数
      vim.keymap.set('n', '[a', ':SidewaysLeft<CR>')
      vim.keymap.set('n', ']a', ':SidewaysRight<CR>')
      vim.keymap.set('n', 'ga', ':SidewaysJumpRight<CR>')
    end
  },
  {
    event = "VeryLazy",
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      -- 内部打开终端， akinsho/toggleterm.nvim
      require('toggleterm').setup({
        direction = 'float',
        open_mapping = [[<c-\>]]
      })
    end
  },
  {
    event = "VeryLazy",
    'kevinhwang91/nvim-ufo',
    dependencies = {
      event = "VeryLazy",
      'kevinhwang91/promise-async'
    },
    config = function()
      require('ufo').setup({
        provider_selector = function()
          vim.o.foldcolumn = '1' -- '0' is not bad
          vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
          vim.o.foldlevelstart = 99
          vim.o.foldenable = true

          vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
          vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

          return { 'treesitter', 'indent' }
        end
      })
    end
  },
  {
    event = "VeryLazy",
    'dhruvasagar/vim-prosession',
    dependencies = {
      event = "VeryLazy",
      'tpope/vim-obsession',
    }
  },
  {
    event = "VeryLazy",
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_enabled = 0

      local git_blame = require('gitblame')

      git_blame.is_blame_text_available() -- Returns a boolean value indicating whether blame message is available
      git_blame.get_current_blame_text()  --  Returns a string with blame message
    end
  },
}
