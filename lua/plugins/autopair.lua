--for good closing features
return { "windwp/nvim-autopairs",
    event = "InsertEnter",
	opts = {
		disable_filetype = { "TelescopePrompt" , "tex" },
	},
	config = function ()
		require('nvim-autopairs').setup()
	end
}
