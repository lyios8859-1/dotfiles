return {
  -- lazy = true,
  -- event = "VeryLazy",
  'nvim-tree/nvim-tree.lua',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
      update_focused_file = {
        enable = true,
        update_cwd = true
      },
      view = {
        width = 30,
      },
      filters = {
        custom = {
          '^.git$',
          '^node_modules$',
        }
      },
      git = {
        enable = fasle
      },
      log = {
        enable = true,
        types = {
          diagnostics = true
        }
      },
      diagnostics = {
        enable = true,
        show_on_dirs = fasle,
        debounce_delay = 50,
        icons = {
          hint = 'H',
          info = 'I',
          warning = "W",
          error = "E"
        }
      }
    })

  end
}
