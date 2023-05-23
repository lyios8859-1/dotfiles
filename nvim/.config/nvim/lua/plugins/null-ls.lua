return 	{
  event = "VeryLazy",
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local keymap =  vim.keymap;
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- keymap.set("n", "<leader>f", vim.diagnostic.open_float)
    keymap.set("n", "[d", vim.diagnostic.goto_prev)
    keymap.set("n", "]d", vim.diagnostic.goto_next)
    keymap.set("n", "<leader>qq", vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),

      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- 注意进入对应定义的函数或者变量后，Ctrl+o 返回

        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- ff 格式化
        keymap.set("n", "ff", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
