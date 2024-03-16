local dap = require('dap')

-- Leader + Debug Continue
vim.keymap.set('n', '<F1>', dap.continue)
-- Leader + Debug step OVer
vim.keymap.set('n', '<F2>', dap.step_over)
-- Leader + Debug step INto
vim.keymap.set('n', '<F3>', dap.step_into)
-- Leader + Debug step OUt
vim.keymap.set('n', '<F4>', dap.step_out)
-- Leader + Debug BReakpoint
vim.keymap.set('n', '<leader>dbr', dap.toggle_breakpoint)

local dapui = require("dapui")
dapui.setup()

-- Leader + Dap Ui Toggle
vim.keymap.set('n', '<leader>dut', dapui.toggle)

dap.listeners.after.event_initialized["dapui_config"]=function()
    require('dapui').open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
    require('dapui').close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
    require('dapui').close()
end
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

