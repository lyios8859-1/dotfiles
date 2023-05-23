return {
  event = "InsertEnter",

  {
    "rust-lang/rust.vim",
    dependencies = { "mattn/webapi-vim" },
    config = function()
      vim.o.completeopt = "menuone,noinsert,noselect"
      vim.opt.shortmess = vim.opt.shortmess + "c"
      vim.g.rustfmt_autosave = 1
      -- -- vim.g.rustfmt_autosave_if_config_present = 1 -- auto save with format
      -- -- vim.g.rustfmt_fail_silently = 1 -- report error
    end
  },
  {
    lazy = true,
    "saecki/crates.nvim", tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("crates").setup({})
    end
  },
  {
    "simrat39/rust-tools.nvim",  --  rust 开发环境工具
    -- ft = "rust",
    dependencies = {
      "neovim/nvim-lspconfig",

      "nvim-lua/plenary.nvim",
    },
    config = function()

      local rt = require("rust-tools")

      local function on_attach(client, bufnr)
        -- This callback is called when the LSP is atttached/enabled for this buffer
        -- we could set keymaps related to LSP, etc here.
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configure LSP through rust-tools.nvim plugin.
      -- rust-tools will configure and enable certain LSP features for us.
      -- See https://github.com/simrat39/rust-tools.nvim#configuration
      local opts = {
        filetypes = { "rust" },
        tools = {
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
        server = {
          -- on_attach is a callback called when the language server attachs to the buffer
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              }
            },
          },
        },
      }

      require("rust-tools").setup(opts)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    -- debugger
    --
    -- 末行模式运行 RustDebuggables
    -- 打断点  DapToggleBreakpoint
    -- 一行一行执行 DapStepOver
    -- 系统再安装 lldb
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end
  }
}

-- local widgets = require('dap.ui.widgets');
-- local sidebar = widgets.sidebar(widgets.scopes);
-- sidebar.open();
