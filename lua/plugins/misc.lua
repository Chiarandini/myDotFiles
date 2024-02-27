--  ╔══════════════════════════════════════════════════════════╗
--  ║                      miscellaneous                       ║
--  ╚══════════════════════════════════════════════════════════╝

return {
	-- for navigating to websites
	{
		keys = { "gx" },
		"stsewd/gx-extended.vim",
	},

	-- ISSUE: breaks ftplugin loading, Abolish in particular
	-- preferred starting program
	-- {
	-- 	'echasnovski/mini.starter',
	-- 	version = false,
	-- 	config = function()
	-- 		require('mini.starter').setup{}
	-- 	end,
	-- },
	-- 	'goolord/alpha-nvim',
	--
	-- 	config = function ()
	-- 		require'alpha'.setup(require'alpha.themes.dashboard'.config)
	-- 	end
	-- },

	--to look at weather
	{
		"ellisonleao/weather.nvim",
		cmd = "Weather",
		opts = {
			city = "toronto", -- with be used if no param is passed to :Weather
			win_height = 12, -- popup height
			win_width = 40, -- popup width
		},
	},

	-- for fun, type CellularAutomation<space> and choose
	{
		"eandrju/cellular-automaton.nvim",
		cmd = "CellularAutomaton",
	},

	-- Pretty animations
	--options: "leaves", "snow", "stars", "xmas", "spring", "summer"
	{
		"folke/drop.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.drop")
		end,
	},
	{
		"stevearc/dressing.nvim",
		dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
		opts = {},
		event = "VeryLazy",
		config = function()
			require("configs.dressing")
		end,
	},
	{ -- for less distractions
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		dependencies = { "folke/twilight.nvim" },
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
	},
	{ -- to look pretty
		"anuvyklack/windows.nvim",
		event = "BufReadPre", -- this behavior might be annoying. I don't mind it.
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function(_, opts)
			require("configs.windows")
		end,
	},
	{
		"axkirillov/hbac.nvim",
		event = "VeryLazy",
		config = function()
			require('configs.hbac')
		end,
	},
	{ -- https://github.com/monaqa/dial.nvim
		"monaqa/dial.nvim",
		event = "VeryLazy",
		-- keys = {
		-- 	{"<C-q>", function() require("dial.map").inc_normal()end},
		-- 	{"<C-x>", function() require("dial.map").dec_normal()end},
		-- 	{"g<C-a>", function() require("dial.map").inc_gnormal()end},
		-- 	{"g<C-x>", function() require("dial.map").dec_gnormal()end},
		-- 	{"<c-q>", function() require("dial.map").inc_visual()end, mode = 'v'},
		-- 	{"<C-x>", function() require("dial.map").dec_visual()end, mode = 'v'},
		-- 	{"g<C-a>", function() require("dial.map").inc_gvisual()end, mode = 'v'},
		-- 	{"g<C-x>", function() require("dial.map").dec_gvisual()end, mode = 'v'},
		-- },
		config = function()
			require("configs.dial")
		end,
	},
	-- { -- highliht lines shown in cmdline (commented to see if it effects lag)
	-- 	"winston0410/range-highlight.nvim",
	-- 	dependencies = { "winston0410/cmd-parser.nvim" },
	-- 	event = "CmdlineEnter",
	-- 	config = function()
	-- 		require("range-highlight").setup()
	-- 	end,
	-- },
	{
		"samodostal/image.nvim",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
		config = function()
			require("configs.image")
		end,
	},
}

-- TODO: Excited for this to come out: https://github.com/Bekaboo/dropbar.nvim

-- for session management
-- 	{
-- 		'Shatur/neovim-session-manager',
-- 		config = function()
-- 			local Path = require('plenary.path')
-- 			local config = require('session_manager.config')
-- 			require('session_manager').setup({
-- 				sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
-- --				session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
-- --				dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
-- 				autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
-- 				autosave_last_session = true, -- Automatically save last session on exit and on session switch.
-- 				autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
-- 				autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
-- 				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
-- 				'gitcommit',
-- 				'gitrebase',
-- 			},
-- 			autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
-- 			autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
-- 			max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
-- 		})
-- 	end
-- 	},

-- for easier integration with new neovim UI elements
-- see https://github.com/stevearc/dressing.nvim
