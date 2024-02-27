--prefered satusline
--(tabline for nice tabs, disable all other features)
return {
	'nvim-lualine/lualine.nvim',
	event = 'UIEnter',
	dependencies =
	{
		{ 'nvim-tree/nvim-web-devicons', lazy = true },
		-- {'kdheepak/tabline.nvim',
		-- config = function()
		-- 	require'tabline'.setup {enable = false}
		-- end },
		-- WARN: might be creating too many threads, trying lsp-progress
		-- { 'chrisgrieser/nvim-dr-lsp' },
		{
			'linrongbin16/lsp-progress.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			config = function()
				require('lsp-progress').setup()
			end
		}
	},
	config = function()
		require('configs.lualine')
	end
}
