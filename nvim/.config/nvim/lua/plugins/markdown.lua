return {
  event = "InsertEnter",

  -- markdown 预览插件, 在末行模式执行 MarkdowmPreview 即可在浏览器打开预览
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  }
}
