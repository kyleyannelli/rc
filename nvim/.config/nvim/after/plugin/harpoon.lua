local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()

-- Add current file to harpoon (to call a function it needs to be in a function)
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
-- Open harpoon menu
vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- Select number x from harpoon
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

