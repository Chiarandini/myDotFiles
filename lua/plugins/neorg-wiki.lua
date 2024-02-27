return {
	{
		"nvim-neorg/neorg",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{'<space>ww', '<cmd>Neorg index<cr>', desc = 'open [N]eorg wiki'},
			{'<space>wt', '<cmd>tabe<cr><cmd>Neorg index<cr>', desc = 'open [N]eorg wiki (new tab)'},
			{'<space>wv', '<cmd>vs<cr><cmd>Neorg index<cr>', desc = 'open [N]eorg wiki (vsplit)'},
			{'<space>wr', '<cmd>Neorg return<cr>', desc = 'Close all Neorg Buffers'},
		},
		cmd = 'Neorg',
		ft = {"norg"},
		build = ":Neorg sync-parsers",
		-- options for neorg. This will automatically call `require("neorg").setup(opts)`
		config = function()
			require('configs.neorg')
		end
	},
}
