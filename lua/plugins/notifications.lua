--prettier notification
-- see https://github.com/folke/noice.nvim#%EF%B8%8F-configuration

return{
	{'rcarriga/nvim-notify',
	event = 'VeryLazy',
	config = function()
		require('configs.notify')
	end},

-- ISSUE: I think this is causing latex to really lag, commenting for now
	-- {
	-- "folke/noice.nvim",
	-- event = "VeryLazy",
	-- dependencies = {
	-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 	"MunifTanjim/nui.nvim",
	-- 	-- OPTIONAL:
	-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 	--   If not available, we use `mini` as the fallback
	-- 	"rcarriga/nvim-notify",
	-- },
	-- config = function()
	-- 	require('configs.noice')
	-- end,
	-- }
}
