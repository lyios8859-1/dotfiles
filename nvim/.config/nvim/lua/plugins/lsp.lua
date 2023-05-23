-- 语法提示插件 LSP
return {
  -- lazy = true,
  event = "VeryLazy",

  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- mason.nvim 和 lspconfig 的桥梁插件
  },

  config = function()

    -- 启动 LSP 的语法提示插件
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    require("mason-lspconfig").setup({
      -- 确保安装，根据需要填写,语言的代码检测需要的服务
      ensure_installed = {
        "lua_ls",
        "rust_analyzer"
      },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    -- 将 LSP 和 自动补全结合, 如果退出进入底下没有提示，就在末行模式输入 Mason 回车加载,并且可一在显示的界面搜索需要安装的插件，选中后输入 i 后安装
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- lspconfig.rust_analyzer.setup {
    --   -- Server-specific settings. See `:help lspconfig-setup`
    --   settings = {
    --     ['rust-analyzer'] = {
    --       diagnostics = {
    --         enable = false;
    --       },
    --       -- enable clippy on save
    --       checkOnSave = {
    --         command = "clippy",
    --       }
    --     },
    --   },
    -- }
  end
}
