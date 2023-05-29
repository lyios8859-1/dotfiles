return {
  {
    'rust-lang/rust.vim',
    dependencies = {
      'mattn/webapi-vim'
    },
    config = function()
      vim.o.completeopt = 'menuone,noinsert,noselect'
      vim.opt.shortmess = vim.opt.shortmess + 'c'
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local crates = require('crates')
      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
      }
      })
    end
  },
  {
    'rcarriga/nvim-dap-ui',
    -- 系统安装 lldb 工具
    --
    -- debugger
    --
    -- 末行模式运行 RustDebuggables
    -- 打断点  DapToggleBreakpoint
    -- 一行一行执行 DapStepOver
    --
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-lua/plenary.nvim'
    },
    config = function()

      local dap = require('dap')

      dap.adapters.lldbrust = {
        type = "executable",
        attach = { pidProperty = "pid", pidSelect = "ask" },
        -- 这里指向lldb-vscode的实际路径
        -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        -- 参考 https://zhuanlan.zhihu.com/p/590908735
        -- lldb-vscode lldb-server 提前编译好的路径
        command = "/usr/bin/lldb-vscode",
        env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
      }
      dap.adapters.rust = dap.adapters.lldbrust

      dap.configurations.rust = {
        {
          type = "rust",
          request = "launch",
          name = "lldbrust",
          program = function()
            local metadata_json = vim.fn.system "cargo metadata --format-version 1 --no-deps"
            local metadata = vim.fn.json_decode(metadata_json)
            local target_name = metadata.packages[1].targets[1].name
            local target_dir = metadata.target_directory
            return target_dir .. "/debug/" .. target_name
          end,
          args = function()
      -- 同样的进行命令行参数指定
            local inputstr = vim.fn.input("CommandLine Args:", "")
            local params = {}
            for param in string.gmatch(inputstr, "[^%s]+") do
              table.insert(params, param)
            end
            return params
          end,
        },
      }

      -- 断点快捷键设置
      -- https://github.com/mfussenegger/nvim-dap/tree/56118cee6af15cb9ddba9d080880949d8eeb0c9f
      -- 设置断点
      vim.keymap.set('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')

      vim.keymap.set('n', '<leader>du', ':lua require("dap").continue()<CR>')

      -- 单步
      vim.keymap.set('n', '<leader>do', ':lua require("dap").step_over()<CR>')
      -- 进入
      vim.keymap.set('n', '<leader>dr', ':lua require("dap").step_into()<CR>')

      -- https://github.com/rcarriga/nvim-dap-ui
      -- 显示断点变量作用域栈信息
      vim.keymap.set('n', '<leader>da', ':lua require("dapui").toggle()<CR>')

      require('dapui').setup()
    end
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      "hrsh7th/cmp-nvim-lsp",
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local rt = require("rust-tools")
      local cmpLsp = require('cmp_nvim_lsp')
      local capabilities = cmpLsp.default_capabilities()
      rt.setup({
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
        server = {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>dc", rt.hover_actions.hover_actions, {
              buffer = bufnr
            })
            vim.keymap.set("n", "<leader>df", rt.code_action_group.code_action_group, {
              buffer = bufnr
            })
          end,
          settings = {
            ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              }
            },
          }
        },
      })
    end
  },
}
