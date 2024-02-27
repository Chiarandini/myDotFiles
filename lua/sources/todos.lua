-- Custom nvim-cmp source for Todo's

local Todos = {}

local registered = false

Todos.setup = function()
	if registered then
		return
	end
	registered = true

	local has_cmp, cmp = pcall(require, "cmp")

	if not has_cmp then
		return
	end

	--TODO: make this smarter
	local words = { "TODO", "HACK", "WARN", "PERF", "NOTE", "TEST" }
	-- local words = {
	-- 	hack = {'HACK'}, -- 
	-- 	warn = {'WARN', 'XXX', 'WARNING'}, -- 
	-- 	todo = {'TODO'}, -- 
	-- 	pref = {'PERF', 'OPTIM', 'PERFORMANCE', 'OPTIMIZE'}, -- 
	-- 	note = {'NOTE', 'INFO'}, -- 
	-- 	test = {'TEST', 'TESTING', 'PASSED', 'FAILED'}, -- ⏲
	-- 	fix  = {'FIX', 'FIXME', 'BUG', 'FIXIT', 'ISSUE'}, -- 
	-- }


	local source = {}

	source.new = function()
		return setmetatable({}, { __index = source })
	end

	source.get_trigger_characters = function()
		return { "@" }
	end

	source.get_keyword_pattern = function()
		-- Add dot to existing keyword characters (\k).
		return [[\%(\k\|\.\)\+]]
	end

---@diagnostic disable-next-line: unused-local
	source.complete = function(self, request, callback)
		local input = string.sub(request.context.cursor_before_line, request.offset - 1)
		local prefix = string.sub(request.context.cursor_before_line, 1, request.offset - 1)

		if vim.startswith(input, "@") and (prefix == "@" or vim.endswith(prefix, " @")) then
			local items = {}
			for _, word in ipairs(words) do
				table.insert(items, {
					filterText = word,
					label = word,
					textEdit = {
						newText = '-- ' .. word .. ': ',
						range = {
							start = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1 - #input,
							},
							["end"] = {
								line = request.context.cursor.row - 1,
								character = request.context.cursor.col - 1,
							},
						},
					},
				})
			end
			callback({
				items = items,
				isIncomplete = true,
			})
		else
			callback({ isIncomplete = true })
		end
	end

	cmp.register_source("Todos", source.new())
end

return Todos
