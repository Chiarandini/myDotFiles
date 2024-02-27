--  ╔══════════════════════════════════════════════════════════╗
--  ║                       Colorscheme                        ║
--  ╚══════════════════════════════════════════════════════════╝

--  ╔══════════════════════════════════════════════════════════╗
--  ║      --mapping for selecting colorscheme: <space>C       ║
--  ╚══════════════════════════════════════════════════════════╝

-- local colorSchemeKey = '<space>C'
-- default colourscheme
return {
	{
		-- 'AlexvZyl/nordic.nvim',
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	require 'nordic'.load()
		-- end
	},

	{
		-- "2nthony/vitesse.nvim",
		-- dependencies = {
		-- 	"tjdevries/colorbuddy.nvim"
		-- },
		-- config = function()
		-- 	require("vitesse").setup()
		-- 	require 'vitesse'.load()
		-- end
	},
	{
		"ellisonleao/gruvbox.nvim",
		keys = '<space>C',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	--backup in case top doesn't work
	-- 'morhetz/gruvbox'

	-- other nice colourshemes
	{
		'rose-pine/neovim',
		keys ='<space>C'
	},

	{
		"folke/tokyonight.nvim",
		keys ='<space>C'
	},

	{
		"rebelot/kanagawa.nvim",
		keys ='<space>C'
	},

	{
		"jacoborus/tender.vim",
		keys ='<space>C'
	},

	{
		"nyoom-engineering/nyoom.nvim",
		keys ='<space>C'
	},

	{
		"savq/melange-nvim",
		keys ='<space>C'
	},

	{
		"patstockwell/vim-monokai-tasty",
		keys ='<space>C'
	},

	{
		"ray-x/aurora",
		keys ='<space>C'
	},
	-- { -- for vs-code like experience
	-- 	"askfiy/visual_studio_code",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("visual_studio_code").setup({
	-- 			mode = "dark",
	-- 		})
	-- 	end,
	-- },
}
