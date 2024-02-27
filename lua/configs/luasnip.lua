--  ╔══════════════════════════════════════════════════════════╗
--  ║                   luasnip configuation                   ║
--  ╚══════════════════════════════════════════════════════════╝

-- ls.setup, LuaSnipEdit, jump config, cycling config, sourcing
local ls = require('luasnip')
local types = require "luasnip.util.types"
--==========
--call setup
--==========

ls.setup({
 	-- This tells LuaSnip to remember to keep around the last snippet.
 	-- You can jump back into it even if you move outside of the selection
	-- for now set to false since I think I'm too inconsistent with changing my mind all
	-- the time
 	history = false,

	 -- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI", --update changes as you type

    -- Autosnippets:
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
			virt_text = { { " « (cycle: <C-q>, fuzzy: <c-s-q>)", "GruvboxGreenBold" } },
				-- virt_text = { { "●", "GruvboxOrange" } }, -- GruvboxOrange -- GruvboxBlue
				-- virt_text = { { " « ", "NonTest" } },
			},
		},
		[types.insertNode] = {
			active = {
			virt_text = { {"●", "NonTest" } },
				-- virt_text = { { "●", "GruvboxOrange" } }, -- GruvboxOrange -- GruvboxBlue
				-- virt_text = { { " « ", "NonTest" } },
			},
		},

	},

	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,

	-- Also load both lua vimscript in lua file
	-- Other filetypes just load themselves.
	load_ft_func =
	  require("luasnip.extras.filetype_functions").extend_load_ft({
		  html = {'javascript'},
		  lua = {'vim'},
	  }),

	-- for slecting text
	store_selection_keys = "<Tab>",
})

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

-- to edit snippets (can also do <space>cs, for [c]onfig [s]nippets)
vim.api.nvim_create_user_command('LuaSnipEdit', function() require("luasnip.loaders.from_lua").edit_snippet_files() end, {desc = "edit snippet files"})
vim.keymap.set('n', '<space>es', '<cmd>LuaSnipEdit<cr>', {desc = 'edit snippets'} )


vim.cmd([[
" cycle through choice Node
imap <silent><expr> <c-q> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-q>'
smap <silent><expr> <c-q> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-q>'

" TODO: make it luasnip-picker
" imap <silent><expr> <c-s-q> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-e>'
" smap <silent><expr> <c-s-q> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<c-e>'



" Use jk to expand and jump through snippets
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
]])



-- source snippets
vim.cmd([[
function SourceSnippets()
	for f in split(glob('~/.config/nvim/LuaSnip/*.lua'), '\n')
		exe 'source' f
	endfor
	echom 'snippets sourced'
endfunction
nnoremap <leader>ss <cmd>call SourceSnippets()<cr>
]])



--  +------------------------------------------------------------------+
--  |                                --                                |
--  |             see shortcuts in ~/.config/nvim/LuaSnip/             |
--  |                                --                                |
--  +------------------------------------------------------------------+
