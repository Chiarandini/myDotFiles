--save files to switch between quickly
-- WARN: I'm looking for global marks rather than project specific marks

return{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	event='VeryLazy',
	config = function()
		require('configs.harpoon')
	end
}

-- might do this


--  ╔══════════════════════════════════════════════════════════╗
--  ║                  better file navigation                  ║
--  ╚══════════════════════════════════════════════════════════╝


-- -- TODO: to switch quickly between wanted files (might use harpoon)
-- {
-- 	"cbochs/grapple.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- },
