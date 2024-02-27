-- spotify in vim
-- ISSUE: currently problematic, seems development stopped fixing bugs
return{'KadoBOT/nvim-spotify',
cmd = {'SpotifyPause', 'Spotify'},
keys = {
	{"<leader>sn", "<Plug>(SpotifySkip)", silent = true, desc= '[s]potify [n]ext'}, -- Skip the current track
	{"<leader>sp", "<Plug>(SpotifyPause)", silent = true, desc= '[s]potify [p]ause'}, -- Pause/Resume the current track
	-- using this for sourcing snippets
	-- {"<c-s>ss", "<Plug>(SpotifySave)", { silent = true, desc= '[s]potify [s]ave' }}, -- Add the current track to your library
	{"<c-s>s", "<cmd>Spotify<CR>", silent = true, desc= '[s]potify [o]pen'}, -- Open Spotify Search window
	{"<leader>sd", "<cmd>SpotifyDevices<CR>", silent = true, desc= '[s]potify [d]evices'}, -- Open Spotify Devices window
	{"<leader>sb", "<Plug>(SpotifyPrev)", silent = true, desc= '[s]potify [p]revious'}, -- Go back to the previous track
	{"<leader>sh", "<Plug>(SpotifyShuffle)", silent = true, desc= '[s]potify [s]huffle'} -- Toggles shuffle mode
	},
dependencies = 'nvim-telescope/telescope.nvim',
build = 'make',
config = function()
	require('configs.spotify')
end
}
