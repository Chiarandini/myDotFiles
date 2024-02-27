--  ╔══════════════════════════════════════════════════════════╗
--  ║                   Better file edditing                   ║
--  ╚══════════════════════════════════════════════════════════╝

-- More advanced example that also highlights diagnostics:
-- local function jumpWihDiagnostic()
-- 	require("flash").jump({
-- 		matcher = function(win)
-- 			---@param diag Diagnostic
-- 			return vim.tbl_map(function(diag)
-- 				return {
-- 					pos = { diag.lnum + 1, diag.col },
-- 					end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
-- 				}
-- 			end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
-- 		end,
-- 		action = function(match, state)
-- 			vim.api.nvim_win_call(match.win, function()
-- 				vim.api.nvim_win_set_cursor(match.win, match.pos)
-- 				vim.diagnostic.open_float()
-- 			end)
-- 			state:restore()
-- 		end,
-- 	})
-- end
return {
	--https://www.reddit.com/r/neovim/comments/yj2php/lua_alternative_to_vimmatchup/
	--upgrades % key
	{
		"andymass/vim-matchup",
		event = "InsertEnter", -- User ActuallyEditing
		init = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},

	-- NOTE: waiting till 0.10 released
	-- breadcrumb navigation in file
	-- { 'Bekaboo/dropbar.nvim',
	-- 	config= function()
	-- 		require('dropbar').setup()
	-- 	end
	-- },

	--for surround options
	{ "tpope/vim-surround", event = "VeryLazy" },

	--<c-n> in visual mode for multiple cursors
	-- Tutorial: vim -Nu path/to/visual-multi/tutorialrc
	{
		"mg979/vim-visual-multi",
		-- keys = {
		-- 	{'<c-n>',mode = {"i"}},
		-- },
		event = "InsertEnter",
		-- config = function()
		-- setup custom mappings, see :help g:VM_maps
		-- vim.g.VIM_maps = {}

		--If you don't want it enabled in normal mode
		-- vim.g.VM_maps['Find Under'] = ''
		-- end
	},
	--see startup time
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	--  delete extra white space
	{
		"mcauley-penney/tidy.nvim",
		event = "BufWritePre",
		config = function()
			vim.keymap.set("n", "<leader>te", require("tidy").toggle, { desc = "tidy toggle" })
			require("configs.tidy")
		end,
	},

	-- better "." feature
	"tpope/vim-repeat",

	{ -- for good bulk editing
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ -- for nice little side scroll bar with minimal LSP info
		'petertriho/nvim-scrollbar',
		event = "VeryLazy",
		config = function()
			require('configs.scrollbar')
		end
	}
	-- 	-- TODO: only issue is T is remapped in v,

	-- { -- enhanced /? and f,t,F,T
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	--   -- stylua: ignore
	--   keys = {
	-- 	-- { "S", mode = { "n" }, jumpWihDiagnostic, desc = "Flash" },
	-- 	{ "S", mode = { "n" }, function() require('flash').jump() end, desc = "Flash" },
	-- 	-- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	-- 	{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	-- 	{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	-- 	{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	--   },
	-- },
}
