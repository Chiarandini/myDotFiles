local map = function(mode, lhs, rhs, desc)
	local opt =  {buffer = true, silent=true, desc = desc}
	vim.keymap.set(mode, lhs, rhs, opt)
end

vim.opt_local.spell = true
local function shiftEnterOpt ()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local indentLevel = string.match(vim.api.nvim_get_current_line(), '^%s*%-*')
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '', indentLevel .. ' ' })
end
map('n', '<localleader>nr', '<cmd>Neorg return<cr>', 'return from Neorg')
map('i', '<s-cr>', shiftEnterOpt, 'instert "-"')
map('n', '<s-cr>', function() vim.cmd([[startinsert]]) shiftEnterOpt() end, 'inster "-"')

-- vim.cmd([[
-- Abolish -buffer bc because
-- ]])
