return {
  -- lazy = true,
  event = "VeryLazy",

  -- sudo pacman -S ripgrep
  'nvim-telescope/telescope.nvim', tag = '0.1.1', -- 文件检索
  dependencies = {
    event = "VeryLazy",
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files"})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Open Recent File" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
    vim.keymap.set('n', '<leader>rs', builtin.resume, { desc = "Lists the results incl" })  -- 回到上一次操作
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "lsp_document_symbols" })  -- 回到上一次操作

    require('nvim-web-devicons').setup({
      override = {},
      default = true
    })

    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<esc>"] = actions.close
          }
        }
      },
      layout_config = {
        horizontal = {
          preview_cutoff = 100,
          preview_width = 0.6
        }
      }
    })

  end
}
