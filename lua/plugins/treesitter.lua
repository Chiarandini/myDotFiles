--  ╔══════════════════════════════════════════════════════════╗
--  ║                        Treesitter                        ║
--  ╚══════════════════════════════════════════════════════════╝

-- tree-sitter for better highliting among
return {

	-- treesitter itself
	{"nvim-treesitter/nvim-treesitter",
	event = 'BufReadPost',
	-- build = ":TSUpdate",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,

	config = function(_, opts)
		require('configs.treesitter')
	end
	}
}
