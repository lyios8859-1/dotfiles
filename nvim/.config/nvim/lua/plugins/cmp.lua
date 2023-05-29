return {
  event = "VeryLazy",
  'hrsh7th/nvim-cmp',
  dependencies = {
    event = "VeryLazy",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),

        ['<C-z>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<c-g>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<c-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp',
          entry_filter = function(entry)
            return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
          end
        },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        -- https://github.com/onsails/lspkind.nvim
        format = function(entry, vim_item)
          if vim.tbl_contains({ 'path' }, entry.source.name) then
            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              return vim_item
            end
          end
          return lspkind.cmp_format({ with_text = true })(entry, vim_item)
        end
      }
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    vim.cmd([[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]])


    local ls = require("luasnip")
    ls.config.set_config({
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      enable_autosnippets = true,
    })

    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local d = ls.dynamic_node
    local sn = ls.snippet_node

    ls.add_snippets('typescriptreact', {
      s('log', {
        t('console.log("'),
        i(1, ''),
        t('", '),
        i(2, ''),
        t(')'),
      }),
      s('rc', {
        t('export type '),
        i(1),
        t('Props = {}'),
        t({ '', 'export function ' }),
        d(2, function(args)
          -- the returned snippetNode doesn't need a position; it's inserted
          -- "inside" the dynamicNode.
          return sn(nil, {
            -- jump-indices are local to each snippetNode, so restart at 1.
            i(1, args[1]),
          })
        end, { 1 }),
        t('(){return null}'),
      }),
    })

  end
}
