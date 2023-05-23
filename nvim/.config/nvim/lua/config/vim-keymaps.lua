
-- 引导键 + r + n 作用：选择鼠标当前所有一样单词进行修改

-- 保存本地变量
local keymap = vim.keymap
-- local map = vim.api.nvim_set_keymap
-- map('模式','按键','映射为XX',opt)

-- 文件浏览器(Netrw) netrw.vim 插件
-- netrwPlugin 是vim自带的插件自己禁用了，
-- https://zhuanlan.zhihu.com/p/61588081
-- keymap.set("n", "<leader>pv", vim.cmd.Exp)

-- 当超过编辑器的边界视觉上换行了，其实还是一行时，跳行的以实际算一行计算
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- keybindings
local sopt = { noremap = true, silent = true }

-- vertical split 垂直
keymap.set('n', '<leader>ss', ':split<Return><C-w>w', sopt)
-- horizontal split 水平
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', sopt)

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d', sopt)
-- Delete a word forwardwords
keymap.set('n', 'de', 've"_d', sopt)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', sopt)

-- 单行或多行移动
-- 第一个参数 v：表示是在视图模式下, 第二个参数表示需要修改的键
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 连续 > 缩进代码
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

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

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ==================================
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")  -- 使用引导键 和 e 切换文档树


-- rust 断点
keymap.set('', "<leader>db", ":DapToggleBreakpoint<CR>", {desc = "Toggle breakpoint"})
keymap.set('', "<leader>n", ":DapStepOver<CR>", {desc = "Step over"})
keymap.set('', "<leader>dnn", ":RustDebuggables<CR>", {desc = "Rust Debuggables"})
keymap.set('', "<leader>dus", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })


-- bufferline.nvim
-- bufferline 与 nvim-tree 之间的切换, 也就是顶部文件之间的切换
-- keymap.set("n", "<leader>l", ":bnext<CR>")
-- keymap.set("n", "<leader>h", ":bprevious<CR>")

-- bufferline 左右切换
keymap.set("n", "fh", ":BufferLineCyclePrev<CR>")
keymap.set("n", "fl", ":BufferLineCycleNext<CR>")

-- buffer 的选择
keymap.set("n", "<leader>bb", ":buffers<cr>:b<space>")

-- MarkdownPreview 插件
keymap.set("n", "<leader>p", ":MarkdownPreview<CR>")
