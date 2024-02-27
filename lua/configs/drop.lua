local function getTheme()
	local curTime = tonumber(string.sub(os.date(), 12, 13))
	local christmas = string.sub(os.date(), 8, 10) == "Dec" and (tonumber(string.sub(os.date(), 5, 6)) > 19)
	local month = tonumber(string.sub(os.date("%x"), 4, 5))

	-- if late at night or christmas, special return values
	if curTime >= 21 or curTime <= 6 then
		return "stars"
	elseif christmas then
		return "xmas"
	end

	-- return the appropriate season
	if month >= 3 and month < 6 then
		return "spring"
	elseif month >= 6 and month < 10 then
		return "summer"
	elseif month >= 10 and month <= 11 then
		return "leaves"
	elseif (month <= 12) or (month >= 1 and month < 3) then
		return "snow"
	end
end
require("drop").setup({
	---@type DropTheme|string
	theme = getTheme(),       -- default options: "leaves", "snow", "stars", "xmas", "spring", "summer"

	max = 40,                 -- maximum number of drops on the screen
	interval = 150,           -- every 150ms we update the drops
	screensaver = (1000 * 60) * 8, -- show after 8 minutes. Set to false, to disable
	filetypes = {},           -- will enable/disable automatically for the following filetypes
	-- filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
})
