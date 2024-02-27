local Preamble = {}

local registered = false

Preamble.setup = function()
	if registered then
		return
	end
	registered = true

	local has_cmp, cmp = pcall(require, "cmp")

	if not has_cmp then
		return
	end

	--TODO: make this smarter
	local words = {
		'article',
		'book',
		'hw',
		'packages',
		'book-formatting',
		'language-setup',
		'commands',
		'tcolorbox',
		'dynkin',
		'bibliography',
		'bib',
		'proof',
		'all',
	}


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

	local function in_preamble() -- generic environment detection
		local is_inside = vim.fn["vimtex#env#is_inside"]('document')
		return not (is_inside[1] > 0 and is_inside[2] > 0)
	end

---@diagnostic disable-next-line: unused-local
	source.complete = function(self, request, callback)
		local input = string.sub(request.context.cursor_before_line, request.offset - 1)
		local prefix = string.sub(request.context.cursor_before_line, 1, request.offset - 1)

		if (not in_preamble()) and vim.startswith(input, "@") and (prefix == "@" or vim.endswith(prefix, " @")) then
			local items = {}
			for _, word in ipairs(words) do
				table.insert(items, {
					filterText = word,
					label = word,
					textEdit = {
						newText =  word ,
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

	cmp.register_source("Preamble", source.new())
end

return Preamble
