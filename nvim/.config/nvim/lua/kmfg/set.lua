-- Disable mouse
vim.opt.mouse = ""

-- Set relative numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set sane tab spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- VIM will use magic to format
vim.opt.smartindent = true

-- Do not use wraps (gets confusing in complicated blocks)
vim.opt.wrap = false

-- Extend undotree history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Do not persist search highlighting (annoying)
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use more colors supported by terms such as (Alacritty, iTerm2, Kitty, qterminal, & Powershell 6+)
vim.o.termguicolors = true
