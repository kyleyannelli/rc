local hooks = require "ibl.hooks"

-- Define your custom highlight groups for the current scope and other lines
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- Set the highlight for the current scope to light blue
    vim.api.nvim_set_hl(0, "CustomCurrentScope", { fg = "#2A2A2A" })
    -- Set a very dark color for lines not in the current scope
    vim.api.nvim_set_hl(0, "CustomOtherLines", { fg = "#2A2A2A" })
end)

-- Setup indent-blankline with the custom highlight groups
require("ibl").setup {
    indent = {
        -- Define the highlight group for the current scope
        highlight = {"CustomCurrentScope"},
        -- Define the highlight group for the other lines
        -- You can add multiple highlight groups if you have different indent levels
    },
    scope = {
        enabled = true,
        -- Define the highlight group for the current scope
        highlight = {"CustomCurrentScope"},
    },
}

-- Optional: If you want the plugin to also highlight the start of the current scope
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
print("indent.lua is loaded")

