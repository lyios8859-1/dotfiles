-- 设置重新进入文件时，光标留在上次退出的地方
vim.cmd([[
 augroup back_to_leave
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup END
]])

-- 插入模式绝对行号，其他模式相对行号
vim.cmd([[
  augroup toggle_relative_number
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
  augroup END
]])

-- 焦点消失的时候自动保存
vim.cmd([[
  augroup toggle_focuslost
    au!
    au FocusLost * :wa
    au FocusGained,BufEnter * :checktime
  augroup END
]])
-- vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
--   callback = function()
--     -- 事件采用了InsertLeave, 即当编辑器离开插入模式, 便触发保存, 通过Neovim的内置函数vim.fn.execute完成调用.

--     -- 并且, 在执行write之前调用了silent!不显示错误信息, 所以这里就需要注意, 如果保存了一个未命名的新文件, 并不会提示错误, 但是其实并没有完成保存.

--     -- 这里不加pattern参数的话默认是对全局生效, 注意这里我还加了一个提示弹窗, 通过notify插件来完成,
--     -- vim.fn.execute("silent! write")
--     vim.fn.execute("silent write")
--     vim.notify("Auto Saved!", vim.log.levels.INFO, {})
--   end,
-- })

-- 在 copy 后高亮一小会
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      -- higroup = 'Visual',
      -- timeout = 300
    })
  end,
  group = highlight_group,
  desc = 'Highlight on yank',
  pattern = '*',
})
