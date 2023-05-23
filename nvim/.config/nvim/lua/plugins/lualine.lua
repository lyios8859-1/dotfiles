return {
  -- lazy = true,
  -- event = "VeryLazy",
	"nvim-lualine/lualine.nvim",
	dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  -- opts = {
  --   -- 这里会自动调用 require("lualine").setup(opts)
  --   theme = "tokyonight"
  -- },
	config = function(_, opts)
    -- 这样就可以把在 config 中设置的配置和 opts 中设置的配置合并一起使用了
		require("lualine").setup(opts)
	end
}
