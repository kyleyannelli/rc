local builtin = require('telescope.builtin')
-- FZF File Find (ff)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- FZF Git Find (gf) Ex: target folder is ignored
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- Help
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
-- FZF Word Find (wf)
vim.keymap.set('n', '<leader>wf', builtin.live_grep, {})

