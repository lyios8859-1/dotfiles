return {
  {
    -- event = "VeryLazy",
    -- 更强大的tab补全文档信息
    "folke/neodev.nvim",
    config = function()
      -- 需要在 lsp 之前启用
      -- 更强大的tab补全文档信息
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
        library = {
          plugins = { "nvim-dap-ui" },
          types = true
        },
      })
    end
  },
  {
    event = "VeryLazy",
    "williamboman/mason.nvim",
    dependencies = {
      event = "VeryLazy",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      local on_attach = function(_, bufnr, isTsserver)
        -- format on save
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
          callback = function()
            if isTsserver == true then
              require("typescript").actions.removeUnused({ sync = true })
            end

            vim.lsp.buf.format { async = true }
          end
        })
      end

      local masonLspconfig = require("mason-lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lsp_config = {
        capabilities = capabilities,
        group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
        on_attach = function(_, bufnr)
          on_attach(_, bufnr)
        end
      }

      masonLspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "graphql",
          -- "rust_analyzer",
          -- "taplo" -- toml
        },
      })

      masonLspconfig.setup_handlers({
        function(server_name)
          -- vim.notify(server_name, vim.log.levels.INFO, {})
          require('lspconfig')[server_name].setup(lsp_config)
        end,

        lua_ls = function()
          require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          }))
        end,

        tsserver = function()
          -- jose-elias-alvarez/typescript.nvim
          require('typescript').setup({
            server = vim.tbl_extend('force', lsp_config, {
              on_attach = function(_, bufnr)
                on_attach(_, bufnr, true)
              end,
              init_options = {
                preferences = {
                  importModuleSpecifierPreference = 'project=relative',
                  jsxAttributeCompletionStyle = 'none'
                }
              }
            })
          })
        end,

        -- rust_analyzer = function()
        --   print('>>>>>>>>>rust>>>>>>>>>>>>>>')
        -- end
      })

    end
  },
  {
    event = "VeryLazy",
    "neovim/nvim-lspconfig",
    config = function()
      -- local lspconfig = require('lspconfig')
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.rust_analyzer.setup({
      --   -- Server-specific settings. See `:help lspconfig-setup`
      --   capabilities = capabilities,
      --   settings = {
      --     ['rust-analyzer'] = {},
      --   },
      -- })

      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          -- 光标所在的字符词语高亮相同的单词
          vim.api.nvim_exec([[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]], false)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.server_capabilities.documentHighlightProvider then
            -- 光标所在的字符词语高亮相同的单词
            vim.api.nvim_exec([[
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]], false)
          end

        end,
      })

    end
  }
}
