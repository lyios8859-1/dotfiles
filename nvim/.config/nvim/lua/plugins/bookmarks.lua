return {
  event = "VeryLazy",
  'MattesGroeger/vim-bookmarks',
  dependencies = {
    event = "VeryLazy",
    'tom-anders/telescope-vim-bookmarks.nvim'
  },
  config = function()
    vim.g.bookmark_sign = '♥'
    vim.g.bookmark_highlight_lines = 1
    -- mm 是添加和删除标签的快捷键
    -- mi   mn  ma mc mx
    vim.keymap.set('n', 'ma', "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>")
    vim.keymap.set('n', 'mn', "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>")
  end
}
