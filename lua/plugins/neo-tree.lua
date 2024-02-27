return { -- better file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "main",
		keys = {
			-- { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
			{ "<c-t>",      "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
			{ "<c-s>t",      "<cmd>Neotree toggle<cr>", desc = "open neo-tree" },
			{ "<c-s-t>",    "<cmd>Neotree reveal<cr>", desc = "open cur file in neo-tree" },
			{ "<c-s>g", "<cmd>Neotree float git_status<cr>", desc = "gitstatus in dir" }, -- hg to be consistent with gitsigns
		},
		dependencies = {
			"nvim-lua/plenary.nvim", -- backend plugin
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim", -- UI library (also used by Notify and noice)
			-- TODO: depricated. used https://github.com/3rd/image.nvim?tab=readme-ov-file
			"3rd/image.nvim", -- to see images
			"s1n7ax/nvim-window-picker",
		},
		config = function()
			require('configs.neo-tree')
		end,
	},
}
