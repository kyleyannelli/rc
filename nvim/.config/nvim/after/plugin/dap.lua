local dap = require('dap')

-- Leader + Debug Continue
vim.keymap.set('n', '<leader>dc', dap.continue)
-- Leader + Debug step OVer
vim.keymap.set('n', '<leader>dov', dap.step_over)
-- Leader + Debug step INto
vim.keymap.set('n', '<leader>din', dap.step_into)
-- Leader + Debug step OUt
vim.keymap.set('n', '<leader>dou', dap.step_out)
-- Leader + Debug BReakpoint
vim.keymap.set('n', '<leader>dbr', dap.toggle_breakpoint)

