return {

	-- to play tetris in neovim
	{
		"alec-gibson/nvim-tetris",
		cmd = "Tetris",
	},
	{ -- paly black jack
		"alanfortlink/blackjack.nvim",
		cmd = "BlackJackNewGame",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ -- play sudoku
		"jim-fx/sudoku.nvim",
		cmd = "Sudoku",
		config = function()
			require("sudoku").setup({
				-- configuration ...
			})
		end,
	},
	{ -- get intereting news
		"aPeoplesCalendar/apc.nvim",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		cmd = "APeoplesCalendar",
		config = function()
			require("apeoplescalendar").setup() -- configuration options are described below
		end,
	},
	{ -- mine sweepr
		"seandewar/nvimesweeper",
		cmd = "Nvimesweeper",
	},
	{ -- killer sheep
		"seandewar/killersheep.nvim",
		cmd = "KillKillKill",
		config = function()
			require("killersheep").setup({
				gore = false, -- Enables/disables blood and gore.
				keymaps = {
					move_left = "h", -- Keymap to move cannon to the left.
					move_right = "l", -- Keymap to move cannon to the right.
					shoot = "<Space>", -- Keymap to shoot the cannon.
				},
			})
		end,
	},
	{
		'rktjmp/playtime.nvim',
		cmd = 'Playtime',
		config = function()
			require("playtime").setup({})
		end
	},
	{ --type-racing game
		"NStefan002/speedtyper.nvim",
		branch = "main",
		cmd = "Speedtyper",
		opts = {
			-- your config
		}
	},
	{ -- vim-be-good
	"ThePrimeagen/vim-be-good",
	cmd = "VimBeGood",
	opts = true
	},
	{ -- tower defence
		cmd = 'TDStart',
		'efueyo/td.nvim',
    }
}
