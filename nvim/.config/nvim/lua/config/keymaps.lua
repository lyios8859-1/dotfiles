-- local keymap = vim.keymap
-- keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- local map = vim.api.nvim_set_keymap
-- map('模式','按键','映射为XX',opt)

local keymap = vim.keymap

-- 取消掉默认的快捷键功能
keymap.set('n', 's', '<nop>', { noremap = true, silent = true })

-- 当超过编辑器的边界视觉上换行了，其实还是一行时，跳行的以实际算一行计算
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- 上下移动光标
keymap.set("n", "<C-j>", "6j")
keymap.set("n", "<C-k>", "6k")
keymap.set("n", "<C-l>", "6l")
keymap.set("n", "<C-h>", "6h")
-- ctrl u / ctrl + d  只移动10行，默认移动半屏
keymap.set("n", "<C-u>", "10k")
keymap.set("n", "<C-d>", "10j")


-- 写入（保存）
-- keymap.set('i', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
keymap.set('n', '<leader>w', '<cmd>write<cr>')
keymap.set('i', '<leader>w', '<cmd>write<cr>')
keymap.set('n', '<C-s>', '<cmd>write<cr>')
keymap.set('i', '<C-s>', '<cmd>write<cr>')

-- 关闭当前tab (close)
keymap.set('n', 'sc', '<C-w>c')
-- 关闭分割的其他tab (close other)
keymap.set('n', 'so', '<C-w>o')

-- 关闭所有的窗口 (close all)
keymap.set('n', '<leader>sa', '<C-w>o:q<CR>')
-- 关闭当前的窗口 (close current)
keymap.set('n', '<leader>q', ':q<CR>')

-- 强制关闭当前的窗口不保存 (close current)
keymap.set('n', '<leader>Q', ':q!<CR>')

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "H", "^")
keymap.set("n", "L", "$")


local map = vim.api.nvim_set_keymap
local kopt = { noremap = true, silent = true }



-- vertical split 垂直
map('n', '<leader>ss', ':split<Return><C-w>w', kopt)
-- horizontal split 水平
map('n', '<leader>sv', ':vsplit<Return><C-w>w', kopt)

-- Delete a word forward
map('n', 'de', 'vb"_d', kopt)
-- Delete a word backwards
map('n', 'dw', 've"_d', kopt)

-- Select all
map('n', '<C-a>', 'gg<S-v>G', kopt)

-- 单行或多行移动
-- 第一个参数 v：表示是在视图模式下, 第二个参数表示需要修改的键
map("v", "J", ":m '>+1<CR>gv=gv", kopt)
map("v", "K", ":m '<-2<CR>gv=gv", kopt)

-- 连续 > 缩进代码
map('v', '<', '<gv', kopt)
map('v', '>', '>gv', kopt)

-- nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", kopt)

-- MarkdownPreview 插件
keymap.set("n", "<leader>p", ":MarkdownPreview<CR>")
