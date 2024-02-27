--  ┌                                                          ┐
--  │         General insert mode mappings (inoremap)          │
--  └                                                          ┘
--{{

-- local helper = require('helper.keymap-helper')
--TODO: Make sessions Todo this needs to be changed to become relative!!
--nnoremap <leader>ss :mksession! /Users/nathanaelchwojko-srawkey/Library/CloudStorage/OneDrive-Personal/Documents/workSession-

-- Needed, or else <c-w> would become a bad habbit
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { })
vim.keymap.set("i", "<S-BS>", "<Esc>ls", { })
vim.keymap.set("i", "<c-w>", "<nop>", { }) -- vim's default "<c-bs>". disabling to get rid of bad habbit.

vim.keymap.set("i", "<C-a>", "<Esc>ggVG")
vim.keymap.set("i", "<C-v>", "<Esc>\"*pa")
vim.keymap.set("i", "<C-p>",  "<nop>")
vim.keymap.set("i", "<C-s>",  "<nop>")
vim.keymap.set("i", "<C-=>", "<C-r>=")
vim.keymap.set("i", "<S-Tab>", "<BS>")
-- vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")
--}}

--  ┌                                                          ┐
--  │               general normal mode mappings               │
--  │             (vim.keymap.set("n",) (nnoremap)             │
--  └                                                          ┘

--{{

-- to comment copy and comment a line: <c-s-r> in Comment.nvim

-- experimental (either this or treesitter, increment)
--vim.kemap.set('n', '<cr>', 'ciw')
vim.keymap.set('n', '<leader>dd', ':w !diff % -<cr>', {desc='diff unsaved changes'})
vim.keymap.set("n",  "k", "(v:count > 5 ? \"m'\" . v:count : '') . 'k'", {expr = true})
vim.keymap.set("n",  "j", "(v:count > 5 ? \"m'\" . v:count : '') . 'j'", {expr = true})

-- x should not be registered.
-- NOTE: I chose to ignore this, bc of my p/y/v vs P/Y/V system.
-- vim.keymap.set("n",  "x", "\"_x", {expr = true})


--NOTE: don't like the lag of typing, and don't want to change it
--vim.keymap.set("n", "//", ":set hlsearch<cr>/")
--vim.keymap.set("n", "??", ":set hlsearch<cr>?")
vim.keymap.set("n", "<c-g>", "g<c-g>")
vim.keymap.set("n", "<c-a>", "ggVG")
-- vim.keymap.set("n", "gs", ":%s//g<left><left>")
-- vim.keymap.set("n", "gc", ":%s//gc<left><left><left>")
-- vim.keymap.set("n", "gS", ":%s??g<left><left>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- vim.keymap.set('n', 'dd', '"*dd')

-- vim.keymap.set("n", "<C-h>", "<c-w>h", {silent = true})
-- vim.keymap.set("n",  "<C-j>", "<c-w>j", {silent = true})
-- vim.keymap.set("n",  "<C-k>", "<c-w>k", {silent = true})
-- vim.keymap.set("n",  "<C-l>", "<c-w>l", {silent = true})

vim.keymap.set("n", "<c-w><a-h>", "<cmd>tabm -<cr>")
vim.keymap.set("n", "<c-w><a-l>", "<cmd>tabm +<cr>")


vim.keymap.set("n", "zv", "zz10<c-e>")
vim.keymap.set("n", "zx", "zz10<c-y>")


-- vim.keymap.set("n", "y", "\"*y")
--vim.keymap.set("n", "p", "\"*p")
--vim.keymap.set("n", "d", "\"*d")
--vim.keymap.set("n", "x", "\"*x")


-- keep hitting accidentally
-- vim.keymap.set('n', '<f1>', '<nop>')


-- highlight words in the whole buffer that is under the cursor without moving the cursor
vim.keymap.set("n", "-", ":let save_cursor=getcurpos()|let @/ = '\\<'.expand('<cword>').'\\>'|set hlsearch<CR>w?<CR>:%s///gn<CR>:call setpos('.', save_cursor)<CR>", {silent = true, desc = "highlight word  under cusor"})


-- yank file path (have one with vim.notify and without)
-- vim.keymap.set("n", "cp", ":let @* = expand(\"%:p:h\")<cr>:echo \"yanked path\" <cr>", {desc = 'copy path'})
vim.keymap.set(
  "n",
  "cp",
  ":let @* = expand(\"%:p:h\")<cr><cmd>lua vim.notify('yanked path' .. vim.fn.expand(\"%:p:h\"), 'info', {title = 'Yanked!'})<cr>",
  { desc = 'copy path' }
)

vim.keymap.set('n', 'cm', '<cmd>lua vim.notify(vim.fn.system("ls -l " .. vim.fn.expand("%p:h")), 2, {title="Metadata"})<cr>', {desc = 'copy metadata'})

-- use arrow keys to re-size screen
vim.keymap.set("n", "<up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<left>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<right>", "<cmd>vertical resize -2<cr>")

-- More buffer/tab managemnt through Z<key>
vim.keymap.set('n', 'ZA', '<cmd>qa<cr>', {desc = 'Quit Neovim'} )
vim.keymap.set('n', 'ZF', '<cmd>q!<cr>', {desc = 'Quit Neovim Force'} )
vim.keymap.set('n', 'ZT', '<cmd>bdelete! tmp<cr>', {desc = 'delete temporary buffer'} )
vim.keymap.set('n', 'ZB', '<cmd>bdelete<cr>', {desc = 'delete buffer'} )

-- open splits with pipe, + and _
vim.keymap.set('n', '|', '<cmd>vs tmp<cr>', {desc = 'open tmp vsplit'} )
vim.keymap.set('n', '+', '<cmd>tabe<cr>', {desc = 'tab edit'} )
vim.keymap.set('n', '_', '<cmd>sp tmp<cr>', {desc = 'split'} )


--}}

--  ┌                                                          ┐
--  │    general visual mode mapping (vim.keymap.set("v",)     │
--  └                                                          ┘
--{{
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "K", "JVgq")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")
vim.keymap.set("v", ";", ":", {desc = ':'})

-- in line, around line
vim.keymap.set("x", "il", "g_o^")
vim.keymap.set("o", "il", ":normal vil<CR>")
vim.keymap.set("x", "al", "$o0")
vim.keymap.set("o", "al", ":normal val<CR>")

--"make Y/P  to clipboard
vim.keymap.set("v", "Y", "\"*y")
vim.keymap.set("v", "P", "\"*p")
vim.keymap.set("v", "D", "\"*d")

-- move block of text (respects indent)
vim.keymap.set('v', "<down>", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "<up>", ":m '<-2<CR>gv=gv")

--to insert at end of selected text (useful if don't want to delete sugeted text)
-- TODO: should be aware of end of previous slecect, prob use some default marks
vim.keymap.set('s', '<c-a>', '<esc>ea')


-- better <esc> behavior
-- the :<esc> is to dismiss the virtual text that Noice provides, I don't know atm a better way of doing this
-- vim.keymap.set('',  '<Esc>', "<ESC><cmd>noh<CR><cmd>lua require('notify').dismiss()<CR><cmd>let g:ToggleMsgInStatusline=0<cr>:<esc>", {silent = true})
vim.keymap.set('',  '<Esc>', "<ESC><cmd>noh<CR><cmd>lua require('notify').dismiss()<CR>:<esc>", {silent = true})
vim.keymap.set('i',  '<Esc>', "<ESC><cmd>noh<CR><cmd>lua require('notify').dismiss()<CR>:<esc>", {silent = true})


-- TODO: make <Esc> call this function instead
-- local function escFunctionality()
--   vim.o.hlsearch = false
-- ---@diagnostic disable-next-line: missing-fields
--   require('notify').dismiss({})
--   vim.g.ToggleMsgInStatusline = 0
--
--   -- :<esc>
-- end
--}}

--  ┌                                                          ┐
--  │       general commandline mode mapping (cnoremap)        │
--  └                                                          ┘
--{{

vim.keymap.set("c", "<C-l>", "<C-r>=expand(\"%:p:h\")<CR>")
vim.keymap.set("c", '<c-y>', '<c-b>let @*=\'<c-e>\'<cr>')
vim.keymap.set("c", "w'", 'w')

--}}
-- vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
