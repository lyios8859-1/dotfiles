return {
  lazy = true,
  event = "VeryLazy",
  "nvim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    -- Setup language servers.
  -- lspconfig.tsserver.setup {}
  -- lspconfig.rust_analyzer.setup {
  --   -- Server-specific settings. See `:help lspconfig-setup`
  --   settings = {
  --     ['rust-analyzer'] = {},
  --   },
  -- }


  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<space>k', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

      -- format
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  -- format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function()
      vim.lsp.buf.format { async = true }
      vim.notify("Format on save!", vim.log.levels.INFO, {})
    end
  })

  end,
}
