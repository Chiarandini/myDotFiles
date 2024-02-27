return {
	{
		"stevearc/oil.nvim",
		keys = { {'<c-s><c-o>', function() require('oil').open() end, desc = "Oil Mode"}, },
		cmd = { "Oil" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require('configs.oil')
		end,
	},
}
