local set = vim.opt;

set.history = 2000

-- utf8
vim.g.encoding = "UTF-8"
vim.o.termencoding = 'utf-8'
vim.scriptecoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- 启用鼠标
set.mouse:append("a")

-- vim.o.clipboard = "unnamed"
-- copy paste
-- 使用系统剪贴板, 需要安装xsel或xclip程序,否者不生效
set.clipboard:append { 'unnamedplus' }
set.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- 行号
set.number = true
set.relativenumber = true

-- 当文件被外部程序修改时，自动加载
set.autoread = true
set.autowrite = true

-- 禁止创建备份文件
set.backup = false
set.writebackup = false
set.swapfile = false

-- 不可见字符的显示，这里只把空格显示为一个点
set.list = true
set.listchars = "space:·"
set.backspace = 'start,eol,indent'

-- 搜索
set.ignorecase = true
set.smartcase = true
-- 搜索不要高亮
set.hlsearch = true
-- 边输入边搜索
set.incsearch = true

-- 默认新的分割窗口在右边和下边出现
set.splitright = true
set.splitbelow = true

-- ----------------------------
set.cursorline = true -- 显示当前编辑行是一个下划线
set.termguicolors = true -- 把当前编辑行的下划线改成背景形式了突出来
set.winblend = 0
set.wildoptions = 'pum'
set.pumblend = 5
set.background = "dark" -- "light" -- "dark"

set.signcolumn = "yes" -- 编辑器左侧会多一列,显示一些图标指示
set.colorcolumn = "80"  -- 右侧参考线，超过表示代码太长了，考虑换行
-- ----------------------------

-- 缩进
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.scrolloff = 10
set.ai = true -- Auto indent
set.si = true -- Smart indent
set.wrap = false -- No wrap lines

-- always show tabline
vim.o.showtabline = 2

-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2

-- 补全增强
vim.o.wildmenu = true

-- 使用增强状态栏后不再需要 vim 的模式提示
set.showmode = false

-- 行结尾可以跳到下一行
set.whichwrap = 'b,s,<,>,[,],h,l'

-- Finding files - Search down into subfolders
set.path:append('**')
set.wildignore:append {
  '*/node_modules/*',
  "*/target/*",
}
