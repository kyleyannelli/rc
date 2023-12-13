require("kmfg.remap")
require("kmfg.packer")
require("kmfg.set")

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        -- This will say undefined, but it's a global from different dir
        ColorMoreBetter()
    end
})

