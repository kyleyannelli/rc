local flutter_reload_group = vim.api.nvim_create_augroup("FlutterReloadOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
    group = flutter_reload_group,
    pattern = "*.dart",
    callback = function()
        vim.cmd("FlutterReload")
    end,
})
