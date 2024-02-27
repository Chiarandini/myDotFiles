local icons = require('utils.icons')
local opts = {
	plugins = { spelling = true },
	defaults = {
		mode = { "n", "v" },
		["["]  = { name = icons.toggle_on .. " toggleOn" },
		["]"]  = { name = icons.toggle_off .. " toggleOff" },
		["[o"] = { name = icons.options_on .. " Options (on)" },
		["]o"] = { name = icons.options_off .. " Options (off)" },
		["<space>"] = { name = icons.search .. " Search" },
		["<space>g"] = { name = icons.grep .. " Grep" },
		["<space>h"] = { name = icons.git .. " Git" },
		["<space>f"] = { name = icons.find .. " Find" },
		["<space>c"] = { name = icons.config .. " Config" },
		["<space>d"] = { name = icons.diagnostics .. " Diagnostics" },
		["<space>e"] = { name = icons.vim .. " Editor Files" },
		["<space>l"] = { name = icons.nvim_lsp .. " LSP" },
		["<space>w"] = { name = icons.wiki .. " Wiki" },
		["<space>s"] = { name = icons.session .. " Session" },
		["<space>D"] = { name = icons.debug .. " Debug" },
		-- ["<space>T"] = { name = "+Terminal" },

		-- special symbols
		["g"] = { name = icons.plus .. " bonus" },
		["<c-w>"] = { name = icons.tab .. " window" },
		["<c-s>"] = { name = icons.window .. " Pop-up" },
		["<c-t>"] = { name = icons.bars .. " Neo Tree" },

		-- window symbols
		["<c-s>l"] = { name = icons.lazy .. " Lazy" },

		-- <leader> + action
		["<leader>"]  = { name = icons.action .." action" },
		["<leader>b"] = { name = icons.box .. " box" },
		["<leader>B"] = { name = icons.tab .. " Buffer" },
		["<leader>f"] = { name = icons.format .. " format" },
		["<leader>u"] = { name = icons.undo .. " undo" },
		["<leader>r"] = { name = icons.refactor .. " refactor" },
		["<leader>t"] = { name = icons.question_shard .. " toggle" },
		["<leader>z"] = { name = icons.zenMode .. " ZenMode" },
		["<leader>h"] = { name = icons.git .. " hunk/git" },
		["<leader>d"] = { name = icons.debug .. " Debug" },
		["<leader>R"] = { name = icons.run .. " Run" },

		-- spawn/start windows keys
		["<c-s>s"] = { name = icons.spotify .. " spotify" },
	},
	icons = {
		group = "",
	},
	window = {
		border = "shadow",  -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,       -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000,      -- positive value to position WhichKey above other floating windows.
	},
}
-- setup how long before whichKey shows up.
vim.o.timeout = true
vim.o.timeoutlen = 1500
local wk = require("which-key")
wk.setup(opts)
wk.register(opts.defaults)
