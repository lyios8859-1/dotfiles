return {
  -- event = "VeryLazy",
  'jose-elias-alvarez/typescript.nvim',
  config = function()
    vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
    vim.keymap.set('n', '<leader>a', '<cmd>TypescriptAddMissingImports<cr>')
    vim.keymap.set('n', '<leader>r', '<cmd>TypescriptRemoveUnused<cr>')
  end
}
