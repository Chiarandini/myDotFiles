local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- vim.opt.runtimepath:prepend(lazypath)

-- disabling these bc they are not used
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- with alpha not showing statusline, this can be loaded with no flicker!
  checker = { enabled = true }, -- automatically check for plugin updates

  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- setup shortcuts to use lazy
vim.keymap.set("n", "<c-s>ll", "<cmd>Lazy<cr>", { desc = "open [L]azy" })
vim.keymap.set("n", "<c-s>li", "<cmd>Lazy install<cr>", { desc = "[i]nstall plugins" })
vim.keymap.set("n", "<c-s>ls", "<cmd>Lazy sync<cr>", { desc = "[s]ync plugins" })
vim.keymap.set("n", "<c-s>lp", "<cmd>Lazy profile<cr>", { desc = "[p]rofile plugins" })
vim.keymap.set("n", "<c-s>ld", "<cmd>Lazy debug<cr>", { desc = "[d]ebug plugins" })
vim.keymap.set("n", "<c-s><c-g>", "<cmd>lua require('lazy.util').float_term('lazygit')<cr>", { desc = "open lazygit" })
--require('lazy').setup('plugins', {
-- defaults = { lazy = true },
--})
