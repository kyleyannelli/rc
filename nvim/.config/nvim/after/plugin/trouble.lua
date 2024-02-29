local trouble = require("trouble")

-- REQUIRED
trouble:setup()

-- Add current file to trouble (to call a function it needs to be in a function)
vim.keymap.set("n", "<leader>t", function() trouble:toggle() end)

