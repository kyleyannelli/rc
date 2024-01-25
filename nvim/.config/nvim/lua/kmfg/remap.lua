vim.g.mapleader = " "
-- Open Directories (open netrw)
vim.keymap.set("n", "<leader>od", vim.cmd.Ex)

-- Really cool remap to move highlighted text with J & K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Keeps cursor in middle when jumping pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-s>", "<C-u>zz")
-- Keeps cursor in the middle for search term jumping
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Allows paste without picking up deleted content. Does this by pushing to void buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
-- Allows delete without picking up deleted content.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Pushes yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Replace current w!
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Run the current file
vim.keymap.set("n", "<leader>xr", "<cmd>!./%<CR>", { silent = true })

vim.g.copilot_assume_mapped = true
