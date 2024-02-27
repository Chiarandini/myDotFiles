--  ╔══════════════════════════════════════════════════════════╗
--  ║              Important Directories Shortcut              ║
--  ╚══════════════════════════════════════════════════════════╝
--{{
vim.cmd([[command! J cd ~/OneDrive/Documents/junk/]])
vim.cmd([[command! DOC cd ~/OneDrive/Documents/]])
vim.cmd([[command! PIC cd ~/OneDrive/Pictures/]])
vim.cmd([[command! BOOKS cd ~/OneDrive/Documents/Books/]])
vim.cmd([[command! MATH cd ~/OneDrive/Documents/Books/Mathematics/]])
vim.cmd([[command! U cd ~/OneDrive/Documents/University/]])
vim.cmd([[command! CONFIG cd ~/.config/nvim]])
--}}
--  ╔══════════════════════════════════════════════════════════╗
--  ║               Important Setup Directories                ║
--  ╚══════════════════════════════════════════════════════════╝
--{{
HOME = os.getenv("HOME")
-- set location of python3
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
--add spellfile for words not in dictionary
vim.o.spellfile = HOME .. "/.config/nvim/spell/en.utf-8.add"


vim.o.undodir= HOME .. "/.cache/nvim/undo"
-- add location to runtimepath
-- vim.o.runtimepath = vim.o.runtimepath .. HOME .. "/.config/nvim"
--swap file configuation
vim.o.dir = HOME .. "/.cache/nvim/swap"
--}}
