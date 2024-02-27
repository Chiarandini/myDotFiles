
--  ╔══════════════════════════════════════════════════════════╗
--  ║                        Git setup                         ║
--  ╚══════════════════════════════════════════════════════════╝

--NOTE: Using lazygit in a terminal. May consider adding tmux to make it nicer.
return{
	{ -- for nice git visuals
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require('configs.gitsigns')
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = 'Neogit',
		config = function()
			require('neogit').setup()
		end
	},
	{ -- for quickly generating git-ignore files
		"wintermute-cell/gitignore.nvim",
		cmd = 'Gitignore',
		requires = {
			"nvim-telescope/telescope.nvim" -- optional: for multi-select
		}
	}
-- 			-- TODO: Considering neogit over fugitive/rhubarb
--
-- 			--git setup
-- 			-- 'tpope/vim-fugitive',
--
-- 			--github setup
-- 			-- 'tpope/vim-rhubarb',
		}
