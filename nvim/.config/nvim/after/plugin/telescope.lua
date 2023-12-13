local builtin = require('telescope.builtin')
-- FZF File Find (ff)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- FZF Git Find (gf) Ex: target folder is ignored
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- FZF Word Find (wf)
vim.keymap.set('n', '<leader>wf', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

