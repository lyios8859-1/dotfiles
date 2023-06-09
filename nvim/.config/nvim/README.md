# README.md

> 直接克隆到用户的家目录

```sh
$HOME/.config
```

## 作用域设置

> 在 lua 中我们对每个选项都有不同的范围。 我们有全局设置、窗口设置、缓冲区设置和其他一些设置。
> 每一个在 vim 模块中都有自己的命名空间。

- vim.o
  获取或设置常规设置。

  ```lua
  vim.o.background = 'light'
  vim.o.termencoding = 'utf-8'
  vim.o.fileencoding = 'utf-8'
  ```

- vim.wo
  获取或设置窗口范围的选项。

  ```lua
  vim.wo.colorcolumn = '80'
  ```

- vim.bo
  获取或设置缓冲区范围的选项。

  ```lua
  vim.bo.filetype = 'lua'
  ```

- vim.g
  获取或设置全局变量

  ```lua
  vim.g.encoding = "UTF-8"

  -- 使用空格键作为引导键
  vim.g.mapleader = ' '
  ```

- vim.opt
  使用 vim.opt 我们可以设置全局、窗口和缓冲区设置。

  ```lua
  -- buffer dscoped
  vim.opt.autoindent = true

  -- window scoped
  vim.opt.cursorline = true

  -- global scope
  vim.opt.autowrite = true
  ```

- vim.env
  获取或设置环境变量。

  ```lua
  vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
  ```

## vim.keymap.set 参数

```lua
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
```

1. {mode}键绑定应该执行的模式。 它可以是模式列表。 我们需要指定模式的短名称。 以下是一些最常见的。

   - n: Normal 模式.
   - i: Insert 模式.
   - x: Visual 模式.
   - s: Selection 模式.
   - v: Visual + Selection.
   - t: Terminal 模式.
   - o: 操作待定.
   - '': 是的，一个空字符串。 相当于 n + v + o.

2. {lhs} 是我们要绑定的键。

- {rhs} 是我们要执行的操作。 它可以是带有命令或表达式的字符串。 您还可以提供一个 lua 函数。
- {opts} 这必须是一个 lua 表。 如果您不知道什么是“lua 表”，就认为这是一种在一个地方存储多个值的方法。 无论如何，它可以具有这些属性。
- desc：描述键绑定功能的字符串。 你可以写任何你想要的。
  - remap: 一个布尔值，用于确定我们的键绑定是否可以递归。 默认值为假。 如果使用不当，递归键绑定可能会导致一些冲突。 除非您知道自己在做什么，否则不要启用它。 这个递归的东西我后面再解释。
  - buffer: 它可以是布尔值或数字。 如果我们分配布尔值 true 这意味着键绑定将只在当前文件中有效。 如果我们分配一个数字，它需要是一个打开的缓冲区的“id”。
  - silent: 一个布尔值。 确定键绑定是否可以显示消息。 默认值为假。
  - expr: 一个布尔值。 如果启用，它可以使用 vimscript 或 lua 来计算 {rhs} 的值。 默认值为假。

```tex
--
-- 各种语言的配置说明
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack
--
```

## Tmux

- `Ctrl+b %` ：划分左右两个窗格。
- `Ctrl+b "` ：划分上下两个窗格。
- `Ctrl+b <arrow key>`：光标切换到其他窗格。arrow key 是指向要切换到的窗格的方向键
- `Ctrl+b ;` ：光标切换到上一个窗格。
- `Ctrl+b o` ：光标切换到下一个窗格。
- `Ctrl+b {` ：当前窗格与上一个窗格交换位置。
- `Ctrl+b }` ：当前窗格与下一个窗格交换位置。
- `Ctrl+b Ctrl+o` ：所有窗格向前移动一个位置，第一个窗格变成最后一个窗格。
- `Ctrl+b Alt+o` ：所有窗格向后移动一个位置，最后一个窗格变成第一个窗格。
- `Ctrl+b x` ：关闭当前窗格。
- `Ctrl+b !` ：将当前窗格拆分为一个独立窗口。
- `Ctrl+b z` ：当前窗格全屏显示，再使用一次会变回原来大小。
- `Ctrl+b Ctrl+<arrow key>` ：按箭头方向调整窗格大小。
- `Ctrl+b q` ：显示窗格编号。

- `Ctrl+b c` ：创建一个新窗口，状态栏会显示多个窗口的信息。
- `Ctrl+b p` ：切换到上一个窗口（按照状态栏上的顺序）。
- `Ctrl+b n` ：切换到下一个窗口。
- `Ctrl+b <number>` ：切换到指定编号的窗口，其中的 number 是状态栏上的窗口编号。
- `Ctrl+b w` ：从列表中选择窗口。
- `Ctrl+b ,` ：窗口重命名。
