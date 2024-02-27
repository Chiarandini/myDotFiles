--  ╔══════════════════════════════════════════════════════════╗
--  ║                     ===============                      ║
--  ║                     == LSP SETUP ==                      ║
--  ║                     ===============                      ║
--  ╚══════════════════════════════════════════════════════════╝
-- LSP: deals with the static parsing of code. Creates tag blocks, finds errors,
--   gives warning, documentation-hover, go-to-definition,
return {
	{
		'neovim/nvim-lspconfig',
		-- event = 'BufEnter',
		-- event = 'BufReadPost',
		event = 'VeryLazy',
		dependencies = {
			-- LSP Support
			{ 'jay-babu/mason-null-ls.nvim' },
			{
				'williamboman/mason.nvim',
				build = function() pcall(vim.cmd, 'MasonUpdate') end,
				keys = {
					{'<space>m', function() require('mason.ui').open() end, desc = '󰣪 Mason'},
				}
			},
			{ 'williamboman/mason-lspconfig.nvim' },
			{ -- for debugging (must be loaded after mason.nvim)
				'jay-babu/mason-nvim-dap.nvim',
			},
			{ "nvimtools/none-ls.nvim", event = { "BufReadPre", "BufNewFile" }, dependencies = { "mason.nvim" }, },
			{ 'folke/neodev.nvim', config = function() require('configs.neodev') end }, -- for neovim lua
			-- { -- for prettier lsp actions
			-- 	'nvimdev/lspsaga.nvim',
			-- 	event = 'BufReadPost',
			-- 	dependencies = {
			-- 		'nvim-treesitter/nvim-treesitter',
			-- 		'nvim-tree/nvim-web-devicons'
			-- 	},
			-- 	keys = {
			-- 		{'<c-s>o', '<cmd>Lspsaga outline<cr>', desc="LSP outline"},
			-- 	},
			-- 	config = function()
			-- 		require('lspsaga').setup({
			-- 			lightbulb = {
			-- 				sign = false
			-- 			},
			-- 		})
			-- 	end,
			-- },
			{ -- for prettier formatting
				'MunifTanjim/prettier.nvim',
				config = function()
					require('configs.prettier')
				end
			},
			{ -- outining document
				'simrat39/symbols-outline.nvim',
				config = function()
					require("symbols-outline").setup(
					{
					  auto_close = true,
					  auto_preview = true,
					  autofold_depth = 1,
					}
					)
				end
			}
		},
		config = function()
			require('configs.lsp')
		end
	},
}
