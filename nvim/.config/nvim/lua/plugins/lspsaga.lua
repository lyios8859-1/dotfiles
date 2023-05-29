-- Better UI
return {
  event = "VeryLazy",
  "glepnir/lspsaga.nvim",
  dependencies = {
    event = "VeryLazy",
    {"nvim-tree/nvim-web-devicons"},
    --Please make sure you install markdown and markdown_inline parser
    {"nvim-treesitter/nvim-treesitter"}
  },
  config = function()

    require('lspsaga').setup({
      ui = {
        border = 'rounded',
      }
    })

    vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>")
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

  end
}
