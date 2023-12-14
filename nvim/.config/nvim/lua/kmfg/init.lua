require("kmfg.remap")
require("kmfg.lazy")
require("kmfg.set")

local lazy_cmds = vim.api.nvim_create_augroup('lazy_cmds', {clear = true})

vim.api.nvim_create_autocmd("User", {
    group = lazy_cmds,
    pattern = "LazyDone",
    callback = function()
        -- This will say undefined, but it's a global from different dir
        ColorMoreBetter()
    end
})

