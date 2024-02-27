local harpoon = require("harpoon")
local icons = require('utils.icons')

harpoon:setup({})

vim.keymap.set("n", "<leader>hh", function()
	harpoon:list():append()
	vim.notify('file added to harpoon', 2, {title = "Harpoon", icon = icons.fish})
end)
vim.keymap.set("n", "<c-s>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>",     function() harpoon:list():select(1) end)

-- WARN: The  and  keys are already being used...
-- keeping the <C-1> bc I will consider that the "main" file
-- vim.keymap.set("n", "<C-Space>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "",        function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "",        function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<c-s-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<c-s-n>", function() harpoon:list():next() end)
-- vim.keymap.set("n", "<space>h", "<cmd>Telescope harpoon marks<cr>", { desc = icons.fish .. ' harpoon' })
