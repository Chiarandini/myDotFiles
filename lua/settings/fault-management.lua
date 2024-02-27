-- Most important settings maps for immediate access.
vim.keymap.set("n", "<space>ev", "<cmd>vs $MYVIMRC<cr>", {desc="edit $MYVIMRC"})
vim.keymap.set("n", "<space>et", "<cmd>e ~/.config/tmux/tmux.conf<cr>", {desc="edit tmux.conf"})
vim.keymap.set("n", "<space>ey", "<cmd>e ~/.yabairc", {desc="edit .yabairc"})
vim.keymap.set("n", "<space>es", "<cmd>e ~/.skhdrc", {desc="edit .skhdrc"})

-- currently, there is no need to source bc of Lazy, but it may be important in the future; kept in case.
vim.keymap.set("n", "<leader>sv", "<cmd>so $MYVIMRC<cr>")

vim.keymap.set("n", ";", ":", {desc = "you'd be surprised how powerful this is"})

-- I remap J/K to keep centered on the screen while scrolling.
vim.keymap.set("n", "J", "gj<c-e>")
vim.keymap.set("n", "K", "gk<c-y>")

-- preffered undo key (make c-r "redo" the line, i.e. default U)
vim.keymap.set("n", "U", "<c-r>")
vim.keymap.set("n", "<c-r>", "<c-r><cmd>lua require('notify')('use U',3, {title = 'Replace <c-r> with U', timeout = '5000'})<cr>")


-- backup colorscheme
vim.cmd.colorscheme('slate')
