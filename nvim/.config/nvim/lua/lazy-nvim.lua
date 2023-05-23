local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- import 配置表示 lazy 会自己识别 lua/plugins 下的配置文件
  spec = { { import = "plugins" } },
	default = { lazy = true, version = true },
	install = { missing = true, colorscheme = { "tokyonight", "gruvbox" } },
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins(禁用一些插件)
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
			cache = {
				enabled = true,
				path = vim.fn.stdpath('cache') .. 'lazy/cache',
				disable_events = {"VimEnter", "BufReadPre"},
				ttl = 3600 * 24 * 5,
			},
			reset_packpath = true,
		},
	},
})
