return {
  {  event = "VeryLazy", 'mg979/vim-visual-multi' },
  {  event = "VeryLazy", 'gcmt/wildfire.vim' },
  {
    event = "VeryLazy",
    'tpope/vim-surround'
    -- ds" 删除 "
    -- cs)] 修改)为]
  },
  {
    event = "VeryLazy",
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' }
      })
    end
  },
  {
    event = "VeryLazy",
    'rmagatti/alternate-toggler',
    config = function()
      -- true/false这种的快速修改
      -- ["true"] = "false",
      -- ["True"] = "False",
      -- ["TRUE"] = "FALSE",
      -- ["Yes"] = "No",
      -- ["YES"] = "NO",
      -- ["1"] = "0",
      -- ["<"] = ">",
      -- ["("] = ")",
      -- ["["] = "]",
      -- ["{"] = "}",
      -- ['"'] = "'",
      -- ['""'] = "''",
      -- ["+"] = "-",
      -- ["==="] = "!=="
      vim.keymap.set('n', '<space>ta', '<cmd>ToggleAlternate<cr>')
    end
  },
}
