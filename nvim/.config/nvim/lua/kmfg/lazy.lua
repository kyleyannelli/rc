local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- FZF / File Previewer
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    -- Color Scheme (can apply from any repo)
    {
        'loctvl842/monokai-pro.nvim',
        name = 'monokai-pro',
        config = function()
            vim.cmd('colorscheme monokai-pro')
        end
    },
    -- Only syntax coloring. NOT AN LSP
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    -- Easier file marking
    {
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { {"nvim-lua/plenary.nvim"} }
        }
    },
    -- Allows you to see, rollback to, adjust, etc.. changes that have been made in buffer similar to git hist/chlg
    "mbbill/undotree",
    -- Allows movement between BOTH vim & tmux panes with crtl + h/j/k/l
    "christoomey/vim-tmux-navigator",
    -- LSP (goodbye coc.nvim :( <3)
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },
    -- Gives code action pop (still miss Coc Code action menu)
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "<leader>c", require("actions-preview").code_actions)
        end,
    },
})