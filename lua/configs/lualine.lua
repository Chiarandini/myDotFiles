-- =========================================================
-- ||                                                     ||
-- ||██╗░░░░░██╗░░░██╗░█████╗░██╗░░░░░██╗███╗░░██╗███████╗||
-- ||██║░░░░░██║░░░██║██╔══██╗██║░░░░░██║████╗░██║██╔════╝||
-- ||██║░░░░░██║░░░██║███████║██║░░░░░██║██╔██╗██║█████╗░░||
-- ||██║░░░░░██║░░░██║██╔══██║██║░░░░░██║██║╚████║██╔══╝░░||
-- ||███████╗╚██████╔╝██║░░██║███████╗██║██║░╚███║███████╗||
-- ||╚══════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░╚══╝╚══════╝||
-- ||                                                     ||
-- =========================================================

-- for integration with nivm-spotify
-- local status = require'nvim-spotify'.status

--  ╔══════════════════════════════════════════════════════════╗
--  ║              helper functions and variables              ║
--  ╚══════════════════════════════════════════════════════════╝

-- toggled for statusline, both default to false
vim.g.TogglePwdInSatusline  = 0
vim.g.ToggleMsgInStatusline = 0
vim.g.TogglePdfSizeInStatusline = 0

local function pwdOfBuf()
	return vim.fn.getcwd()
end

--- Hide statusline object if column too big
---@param extraCond boolean if there are any extra conditions (usually given by a plugin), put it
---@return boolean status returns wether the statusline object is shown or not
local function columnWidthCond(extraCond)
	if extraCond == nil then
		extraCond = true
	end
	return (vim.fn.winwidth(0) > vim.o.textwidth) and extraCond
end

local function messageInStatusline()
	return columnWidthCond(require("noice").api.status.message.has()) and vim.g.ToggleMsgInStatusline == 1
end

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}



--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
       return str:sub(-trunc_len, -1) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end


---@diagnostic disable-next-line: unused-local, unused-function
local function modeColour()
-- auto change color according to neovims mode
local mode_color = {
  n = colors.green,
  i = colors.blue,
  v = colors.orange,
  [''] = colors.blue,
  V = colors.orange,
  c = colors.magenta,
  no = colors.red,
  s = colors.orange,
  S = colors.orange,
  ic = colors.yellow,
  R = colors.violet,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red,
}
return { fg = mode_color[vim.fn.mode()] }
end

---shortens diff if pane too small
---@param num number represents when the "diff" signs should be deleted
---@return function
local function shortendiff(num)
	return function (str)
		if vim.fn.winwidth(0) > num then
			return str
		end
		str = str:gsub(' ', '')
		str = str:gsub('󰝤 ', '')
		return str:gsub(' ', '')
		-- return 'shorter'
	end
end

local function pfdFileSize()
	local file = tostring(vim.fn.expand('%:p:r')) .. '.pdf'
	local result  =vim.api.nvim_call_function("getfsize" , {file})
	if result > 0 then
		return tostring(vim.fn.expand('%:r')) .. '.pdf ' .. 'size: ' .. result .. ' bytes'
	else
		return 'no ' .. tostring(vim.fn.expand('%:r')) .. '.pdf found'
	end
end

-- TODO: make a function that will return which a-z keys have marks in them (to make
-- it easy to remember that I wanted to jump!)
local function marksVisual()
	return nil
end


--  ╔══════════════════════════════════════════════════════════╗
--  ║                          setup                           ║
--  ╚══════════════════════════════════════════════════════════╝

local opts = {
  options = {
    icons_enabled = true,
    theme = 'powerline', -- gruvbbox, powerline
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'alpha'},
      winbar = {'alpha'},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      -- tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {function() return ' ' end }, -- Just want a green space here
    -- lualine_a = {{'▊', color = modeColour }},
    lualine_b = {
		{
			'branch',
			fmt = trunc(80, 10, 10, false),
		},
		{
			'diff',
			symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
			fmt = shortendiff(80),
		},

	'diagnostics'},
    lualine_c = {
		{'filename'},
        -- { -- used to be searchcount
        --   require("noice").api.status.search.get,
        --   cond = require("noice").api.status.search.has,
        --   color = { fg = "ff9e64" }, -- #ff9e64
        -- },

		{ -- to see when a pdf finishes compiling
			pfdFileSize,
			cond = function() return vim.g.TogglePdfSizeInStatusline == 1 end,
		},
		-- {require('lsp-progress').progress, cond = columnWidthCond},
		{
			pwdOfBuf,
			fmt=trunc(80, 10, 10, false),
			cond = function() return vim.g.TogglePwdInSatusline == 1 end,
		},
	},
		lualine_x = {
			{ '%S', cond = columnWidthCond },

			-- {
			-- 	require("noice").api.status.message.get_hl,
			-- 	-- TODO: impliment a timeout option, don't show errors
			-- 	cond = messageInStatusline,
			-- },

			{ 'filesize', cond = columnWidthCond },
			{ 'filetype', cond = columnWidthCond, icon_only = false },
			-- controlled in init.lua, lazy configuration
			{ require("lazy.status").updates, cond = function() return columnWidthCond(require("lazy.status").has_updates()) end, color = { fg = "#ff9e64" }, },
		},
 --    lualine_x = {
	-- 	-- {'datetime',   cond = function()return vim.fn.winwidth(0) > vim.o.textwidth end, style = '%a %d'},
	-- },
    lualine_y = {
		'progress',
	},
		lualine_z = {'location'},
	},
	inactive_sections = {
	  lualine_a = {},
	  lualine_b = {},
	  lualine_c = {{'filename', newfile_status = true}},
	  lualine_x = {'location'},
	  lualine_y = {},
	  lualine_z = {}
	},
	-- tabline = {
	--   lualine_a = {},
	--   lualine_b = {},
	--   lualine_c = {
	-- 	{ 'tabs', mode = 2 },-- 0: number, 1: name, 2: number and name
	-- 	},
	--   -- lualine_c = {'windows'},
	--   lualine_x = {},
	--   -- lualine_c = {require'tabline'.tabline_buffers},
	--   -- lualine_x = {require'tabline'.tabline_tabs},
	--   lualine_y = {},
	--   lualine_z = {}
	-- },
  tabeline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'neo-tree', 'lazy', 'quickfix', 'trouble'},
}

require('lualine').setup(opts)
vim.opt.laststatus=3
-- listen lsp-progress event and refresh lualine
-- vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
-- vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
--     group = "lualine_augroup",
--     callback = require("lualine").refresh,
-- })

--"local status = require('nvim-spotify').status
--"vim.g.musicStatusLine = status.listen()
--
