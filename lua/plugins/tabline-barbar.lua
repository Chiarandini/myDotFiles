return {

{
	'alvarosevilla95/luatab.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons'},
	config = function()
		require('luatab').setup{}
	end
}
-- {
--     'crispgm/nvim-tabline',
--     dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
--     config = function()
-- 		require('tabline').setup({
-- 			show_index = true,           -- show tab index
-- 			show_modify = true,          -- show buffer modification indicator
-- 			show_icon = true,           -- show file extension icon
-- 			fnamemodify = ':t',          -- file name modifier
-- 			modify_indicator = '[+]',    -- modify indicator
-- 			no_name = 'No name',         -- no name buffer name
-- 			brackets = { ' ', '' },     -- file name brackets surrounding
-- 			inactive_tab_max_length = 0  -- max length of inactive tab titles, 0 to ignore
-- 		})
-- 	end
-- 		,
-- }




-- WARN: I don't like the bufferline approach, I like buffers but tabline
 --  {
	-- 'romgrk/barbar.nvim',
	-- event = 'BufLeave', -- when leaving alpha main page
 --    dependencies = {
 --      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
 --      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
 --    },
 --    init = function() vim.g.barbar_auto_setup = false end,
	-- config = function()
	-- 	require('configs.barbar')
	-- end
 --  },
	-- {
	-- 	"willothy/nvim-cokeline",
	-- 	event = 'UIEnter',
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
	-- 		{'nvim-tree/nvim-web-devicons', lazy = true},
	-- 	},
	-- 	config = function()
	-- 		local get_hex = require("cokeline/utils").get_hex
	-- 		local yellow = vim.g.terminal_color_3
	-- 		require("cokeline").setup({
	-- 			default_hl = {
	-- 				fg = function(buffer)
	-- 					return buffer.is_focused and get_hex("ColorColumn", "bg") or get_hex("Normal", "fg")
	-- 				end,
	-- 				bg = function(buffer)
	-- 					return buffer.is_focused and get_hex("Normal", "fg") or get_hex("ColorColumn", "bg")
	-- 				end,
	-- 			},
	--
	-- 			sidebar = {
	-- 				filetype = "neo-tree",
	-- 				components = {
	-- 					{
	-- 						text = "   Neo Tree",
	-- 						fg = yellow,
	-- 						bg = get_hex("Normal", "bg"),
	-- 						style = "bold",
	-- 					},
	-- 				},
	-- 			},
	-- 			  -- Maintains a history of focused buffers using a ringbuffer
	-- 			  history = {
	-- 				enabled = false
	-- 				-- size = int (default: 2)
	-- 			  },
	-- 			components = {
	-- 				{
	-- 					text = function(buffer)
	-- 						return " " .. buffer.devicon.icon
	-- 					end,
	-- 					fg = function(buffer)
	-- 						return buffer.devicon.color
	-- 					end,
	-- 				},
	-- 				{
	-- 					text = function(buffer)
	-- 						return buffer.unique_prefix
	-- 					end,
	-- 					fg = get_hex("Comment", "bg"),
	-- 					style = "italic",
	-- 				},
	-- 				{
	-- 					text = function(buffer)
	-- 						return buffer.filename .. " "
	-- 					end,
	-- 					style = function(buffer)
	-- 						if buffer.is_hovered and not buffer.is_focused then
	-- 							return "underline"
	-- 						end
	-- 					end,
	-- 				},
	-- 				{
	-- 					text = "",
	-- 					on_click = function(_, _, _, _, buffer)
	-- 						buffer:delete()
	-- 					end,
	-- 				},
	-- 				{
	-- 					text = " ",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- }
}
