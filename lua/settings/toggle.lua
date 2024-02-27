--- quickly map togggles
---@param lhs  string lhs
---@param rhs  string rhs
---@param desc string description
local map = function(lhs, rhs, desc)
	local descr = desc or ''
	vim.keymap.set('n', lhs, rhs, {desc = descr})
end
map("[oa","<cmd>setl autochdir<cr><cmd>setl autochdir?<cr>", 'autochdir')
map("]oa","<cmd>setl noautochdir<cr><cmd>setl autochdir?<cr>", 'noautochdir')
map("[n","<cmd>setl hlsearch<cr><cmd>setl hlsearch?<cr>",  'hlsearch')
map("]n","<cmd>setl nohlsearch<cr><cmd>setl hlsearch?<cr>",  'nohlsearch')
map("[N","<cmd>nnoremap n nzz<cr><cmd>nnoremap N Nzz<cr><cmd>echo 'centered n/N'<cr>",'centered n/N')
map("]N","<cmd>nnoremap n n<cr><cmd>nnoremap N N<cr><cmd>echo 'not centered n/N'<cr>",'not centered n/N')

map('[b', 'gT', 'prev buffer' )
map(']b', 'gt', 'next buffer' )
map('>b', '<cmd>+tabmove<cr>', 'move buf right' )
map('<b', '<cmd>-tabmove<cr>', 'move buf left' )

--For pwd in statusline (used in lualine.lua)
map("[p","<cmd>let g:TogglePwdInSatusline=1<cr><cmd>echo \"TogglePwdInSatusline\"<cr>",'toggle lualine showing path')
map("]p","<cmd>let g:TogglePwdInSatusline=0<cr><cmd>echo \"noTogglePwdInSatusline\"<cr>",'toggle lualine showing path')

-- for messages in statusline
map("[i","<cmd>let g:ToggleMsgInStatusline=1<cr><cmd>echo \"ToggleMsgInStatusline\"<cr>",'toggle lualine showing message')
map("]i","<cmd>let g:ToggleMsgInStatusline=0<cr><cmd>echo \"noToggleMsgInStatusline\"<cr>",'toggle lualine showing message')

-- for seeing pdf size (checking live compiling)
map("[P","<cmd>let g:TogglePdfSizeInStatusline=1<cr><cmd>echo \"TogglePdfSizeInStatusline\"<cr>",'toggle lualine pdf size message')
map("]P","<cmd>let g:TogglePdfSizeInStatusline=0<cr><cmd>echo \"noTogglePdfSizeInStatusline\"<cr>",'toggle lualine pdf size message')

--for quickfix list
map('[q', '<cmd>cprev<cr>', 'quick fix previous')
map(']q', '<cmd>cnext<cr>', 'quick fix next')
map('[Q', '<cmd>cfirst<cr>', 'quick fix first')
map(']Q', '<cmd>clast<cr>', 'quick fix last')

-- from unimpaired that I liked
map('[ob', '<cmd>set background=light<cr>', 'light background')
map(']ob', '<cmd>set background=dark<cr>', 'dark background')
map('[oc',  '<cmd>setlocal cursorline<cr>', 'cursoline')
map(']oc', '<cmd>setlocal nocursorline<cr>', 'nocursorline')
map('[od', '<cmd>diffthis<cr>', 'diffthis')
map(']od', '<cmd>diffoff<cr>', 'diffoff')
map('[oh',  '<cmd>set hlsearch<cr>', 'hlsearch')
map(']oh', '<cmd>set hlsearch<cr>', 'nohlsearch')
map('[oi',  '<cmd>set ignorecase<cr>', 'ignorecase')
map(']oi','<cmd>set noignorecase<cr>', 'noignorecase')
map('[ol',  '<cmd>setlocal list<cr>', 'see trailing characters')
map(']ol','<cmd>setlocal nolist<cr>', 'hide trailing characters')
map('[on',  '<cmd>setlocal number<cr>', 'number')
map(']on','<cmd>setlocal nonumber<cr>', 'nonumber')
map('[or',  '<cmd>setlocal relativenumber<cr>', 'relativenumber')
map(']or','<cmd>setlocal norelativenumber<cr>', 'norelativenumber')
map('[os',  '<cmd>setlocal spell<cr>', 'spell')
map(']os','<cmd>setlocal nospell<cr>', 'nospell')
map('[ot', '<cmd>set colorcolumn=+1<cr>', 'colorcolumn')
map(']ot','<cmd>set colorcolumn=<cr>', 'nocolorcolumn')
map('[ou',  '<cmd>setlocal cursorcolumn<cr>', 'cursorcolumn')
map(']ou','<cmd>setlocal nocursorcolumn<cr>', 'nocursorcolumn')
map('[ov',  '<cmd>set virtualedit+=all<cr>', 'virtualedit')
map(']ov','<cmd>set virtualedit-=all<cr>', 'no virtualedit')
map('[ow',  '<cmd>setlocal wrap<cr>', 'wrap')
map(']ow','<cmd>setlocal nowrap<cr>', 'nowrap')
map('[ox', '<cmd>set cursorline cursorcolumn<cr>', 'x on cursor')
map(']ox', '<cmd>set nocursorline nocursorcolumn<cr>', 'no x on cursor')

-- lsp toggle
map('[oL', '<cmd>LspStart<cr>', 'LspStart' )
map(']oL', '<cmd>LspStop<cr>', 'LspStop' )

-- toggle highlighting variable
map('[oI', '<cmd>IlluminateResumeBuf<cr>', 'enable Illuminate' )
map(']oI', '<cmd>IlluminatePauseBuf<cr>', 'disable Illuminate' )

-- to get [e ]e (swapping lines and [<space ]<space> (adding spaces)
require('settings.fugitive-toggles')

-- toggle making window bigger on buffer switchign
map('[oW', '<cmd>WindowsEnableAutowidth<cr><cmd>echo "animated"<cr>', 'animated windows')
map(']oW', '<cmd>WindowsDisableAutowidth<cr><cmd>echo "static"<cr>', 'static windows')

-- toggle seing text in more easily visualizable blocks
map('[oB', '<cmd>BlockOn<cr>', 'Block On' )
map(']oB', '<cmd>BlockOff<cr>', 'Block Off' )

-- toggle tressitter options
map('[oT', ':TSEnable ', 'Tressitter Enable' )
map(']oT', ':TSDisable ', 'Tressitter Disable' )

-- toggle spelling  (want ]s to only stop at bad words)
vim.keymap.set("n", "[s", "[S")
vim.keymap.set("n", "]s", "]S")

-- tidy toggle
-- map('[oT', '<cmd>set colorcolumn=+1<cr>', 'colorcolumn')
