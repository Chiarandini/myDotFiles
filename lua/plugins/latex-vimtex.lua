--  ╔══════════════════════════════════════════════════════════╗
--  ║                       latex setup                        ║
--  ╚══════════════════════════════════════════════════════════╝
return{

 {
	"lervag/vimtex",
	ft = { "tex" },
	config = function()
		require('configs.vimtex')
	end
},



--for code actions in latex
{ 'barreiroleo/ltex_extra.nvim',
	ft = { 'tex' },
	dependencies = 'lervag/vimtex',
	--config and opts in lsp.lua
}

-- NOTE: No longer needed, vimtex deals with it automatically
-- {
--nicer hiding in vim
-- 	'KeitaNakamura/tex-conceal.vim',
-- 	ft=  {'tex'},
-- 	dependencies = 'lervag/vimtex',
-- 	config = function()
-- 		require('configs.tex-conceal')
-- 	end
-- },
}
