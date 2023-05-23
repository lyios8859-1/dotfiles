return {
  -- lazy = true,
  event = "VeryLazy",

  'nvim-tree/nvim-tree.lua', -- 文档树
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 文档树图标，注意需要图标库 nerdfonts.com
  config = function()
    -- 默认不开启 nvim-tree 的显示在界面
    vim.g.loaded_netrw = 1
    vim.g.loaded_netwPlugin = 1

    -- 在文档树上面 输入 a 就可以开始创建文件了
    -- 启用 nvim-tree 插件
    require("nvim-tree").setup()

    -- o 打开关闭文件夹
    -- a 创建文件
    -- r 重命名
    -- x 剪切
    -- c 拷贝
    -- p 粘贴
    -- d 删除

  end
}
